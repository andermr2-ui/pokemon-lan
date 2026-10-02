# encoding: UTF-8
require "zlib"

def read_meta(dir)
  # Replica fiel de PluginManager.readMeta (ver tools/_dump_PluginManager_clean.rb
  # linea 407), para no mandar claves invalidas que disparen
  # PluginManager.error (que muestra un dialogo BLOQUEANTE sin escribir
  # errorlog.txt ni crashear -- asi es como se detecto este bug: el juego
  # se quedaba "colgado" en silencio al registrar VMS por culpa de un
  # meta.txt mal parseado).
  meta = {}
  File.readlines(File.join(dir, "meta.txt"), encoding: "UTF-8").each do |line|
    line = line.strip
    next if line.empty?
    next unless line =~ /^\s*(\w+)\s*=\s*(.*)$/
    property = $1.upcase
    data = $2.split(",").map(&:strip)
    case property
    when "ESSENTIALS"
      meta[:essentials] ||= []
      data.each { |ver| meta[:essentials].push(ver) }
    when "REQUIRES"
      meta[:dependencies] ||= []
      if data.length < 2
        meta[:dependencies].push(data[0])
      elsif data.length == 2
        meta[:dependencies].push([data[0], data[1]])
      else
        meta[:dependencies].push([data[2].downcase.to_sym, data[0], data[1]])
      end
    when "EXACT"
      next if data.length < 2
      meta[:dependencies] ||= []
      meta[:dependencies].push([:exact, data[0], data[1]])
    when "OPTIONAL"
      next if data.length < 2
      meta[:dependencies] ||= []
      meta[:dependencies].push([:optional, data[0], data[1]])
    when "CONFLICTS"
      meta[:incompatibilities] ||= []
      data.each { |value| meta[:incompatibilities].push(value) if value && !value.empty? }
    when "SCRIPTS"
      # ignorado: los archivos se descubren solos via Dir.glob en compile_plugin
    when "CREDITS"
      meta[:credits] = data
    when "LINK", "WEBSITE"
      meta[:link] = data[0]
    when "NAME"
      meta[:name] = data[0]
    when "VERSION"
      meta[:version] = data[0]
    else
      meta[property.downcase.to_sym] = data[0]
    end
  end
  meta
end

def compile_plugin(dir)
  meta = read_meta(dir)
  # Dir.glob trata [ ] como clase de caracteres, no texto literal -- carpetas
  # como "Plugins/[DBK_004] Z-Power" necesitan escaparse o el glob no
  # encuentra NINGUN archivo (0 archivos) y compile_plugin devuelve la
  # entrada del plugin VACIA, pisando el plugin existente compilado.
  glob_safe_dir = dir.gsub(/[\[\]\{\}\*\?]/) { |c| "\\#{c}" }
  files = Dir.glob(File.join(glob_safe_dir, "**", "*.rb")).sort
  files = files.select { |f| File.extname(f) == ".rb" }
  data = [meta[:name], meta, []]
  files.each do |f|
    relative = f.sub(dir + "/", "")
    content = File.binread(f)
    data[2].push([relative, Zlib::Deflate.deflate(content)])
  end
  puts "#{meta[:name]}: #{files.size} archivos -> #{files.map { |f| f.sub(dir + '/', '') }.join(', ')}"
  data
end

scripts = Marshal.load(File.binread("Data/PluginScripts.rxdata"))
puts "Plugins ya compilados antes: #{scripts.map(&:first).inspect}"

# Cualquier carpeta de Plugins/ que se haya tocado en esta sesion de trabajo.
# Agregar aca cada plugin nuevo/editado antes de correr este script.
DIRS_TO_RECOMPILE = [
  "Plugins/Voltseon's Multiplayer Solution",
  "Plugins/Following Pokemon EX",
  "Plugins/Mom Bank",
  "Plugins/Character Customization",
  "Plugins/Multi Save Slots",
  "Plugins/UI Fixes",
  "Plugins/Story Fixes",
  "Plugins/DescriptionScroll",
  "Plugins/Speed Control",
  "Plugins/Day Care Expansion",
  "Plugins/Mega Stone Pocket",
  "Plugins/[DBK_004] Z-Power",
]

DIRS_TO_RECOMPILE.each do |dir|
  compiled = compile_plugin(dir)
  name = compiled[0]
  idx = scripts.index { |n, _, _| n == name }
  if idx
    scripts[idx] = compiled
  else
    puts "#{name}: nuevo, lo agrego al final"
    scripts.push(compiled)
  end
end

File.open("Data/PluginScripts.rxdata", "wb") { |f| Marshal.dump(scripts, f) }
puts "OK: Data/PluginScripts.rxdata actualizado (#{scripts.size} plugins totales)"

# Verificacion: releer y confirmar
check = Marshal.load(File.binread("Data/PluginScripts.rxdata"))
puts "Verificacion: #{check.map(&:first).inspect}"
