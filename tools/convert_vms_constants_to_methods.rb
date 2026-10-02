# encoding: UTF-8
require_relative "vms_english_texts"

def snake(name)
  name.downcase
end

DEFS_FILE = "Plugins/Voltseon's Multiplayer Solution/001_Base/002_VMS_Config_Messages.rb"

src = File.read(DEFS_FILE, encoding: "UTF-8")
changed = 0
new_src = src.gsub(/^(\s*)([A-Z][A-Z0-9_]*)\s*=\s*_INTL\(.*\)\s*$/) do
  indent = $1
  name = $2
  entry = VMS_CONST_ENGLISH[name]
  if entry.nil?
    warn "SIN TRADUCCION para #{name}, se deja igual"
    next $~[0]
  end
  args = entry[0]
  changed += 1
  "#{indent}def self.#{snake(name)}\n#{indent}  _INTL(#{args})\n#{indent}end"
end
File.write(DEFS_FILE, new_src)
puts "#{DEFS_FILE}: #{changed} constantes convertidas a metodos"

# Reemplazar usos VMS::NOMBRE -> VMS.nombre en todo el plugin.
usage_files = Dir.glob("Plugins/Voltseon's Multiplayer Solution/**/*.rb")
total_usages = 0
usage_files.each do |file|
  next if file.include?(".bak")
  s = File.read(file, encoding: "UTF-8")
  orig = s.dup
  VMS_CONST_ENGLISH.each_key do |name|
    s = s.gsub(/VMS::#{name}\b/, "VMS.#{snake(name)}")
  end
  if s != orig
    File.write(file, s)
    n = VMS_CONST_ENGLISH.keys.sum { |name| orig.scan(/VMS::#{name}\b/).size }
    total_usages += n
    puts "#{file}: #{n} usos actualizados"
  end
end
puts "TOTAL usos VMS::NOMBRE -> VMS.nombre: #{total_usages}"
