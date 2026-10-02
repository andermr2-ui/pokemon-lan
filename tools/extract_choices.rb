# Escaneo incremental: busca comandos "Mostrar Opciones" (code 102) en TODOS
# los mapas y agrega el bloque correspondiente a translations/mapNNN.txt SOLO
# si todavia no existe ese bloque (no pisa traducciones ya hechas).
#
# Formato del bloque de opciones:
#   [evento|pagina|indice|OPCIONES]
#   ORIGINAL: opcion1|opcion2|opcion3
#   TRADUCCION:

require_relative "rpg_stubs"

def clean(text)
  return nil if text.nil?
  text.dup.force_encoding("UTF-8")
end

map_files = Dir.glob("Data/Map*.rxdata").select { |f| File.basename(f) =~ /\AMap\d+\.rxdata\z/ }.sort
Dir.mkdir("translations") unless Dir.exist?("translations")

added = 0
maps_touched = 0

map_files.each do |path|
  map_num = File.basename(path, ".rxdata").sub("Map", "")
  trans_path = "translations/map#{map_num}.txt"
  existing = File.exist?(trans_path) ? File.read(trans_path, encoding: "UTF-8") : ""

  map = File.open(path, "rb") { |f| Marshal.load(f) }
  new_blocks = []

  map.events.each do |event_id, event|
    event.pages.each_with_index do |page, page_index|
      page.list.each_with_index do |cmd, idx|
        next unless cmd.code == 102
        key = "[#{event_id}|#{page_index + 1}|#{idx}|OPCIONES]"
        next if existing.include?(key)
        choices = cmd.parameters[0].map { |c| clean(c) }
        next if choices.all? { |c| c.strip.empty? }
        new_blocks << "#{key}\nORIGINAL: #{choices.join('|')}\nTRADUCCION:\n\n"
        added += 1
      end
    end
  end

  next if new_blocks.empty?
  maps_touched += 1
  prefix = (existing.empty? || existing.end_with?("\n\n")) ? "" : "\n"
  File.open(trans_path, "a") { |f| f.write(prefix + new_blocks.join) }
end

puts "Mapas con comandos de opciones nuevos: #{maps_touched}"
puts "Bloques de opciones agregados: #{added}"
