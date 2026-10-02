# Agrega una entrada de idioma español a Settings::LANGUAGES dentro de
# Scripts.rxdata. Es una edicion minima y quirurgica de UN literal de array de
# datos (no toca logica). Reemplaza el array vacio (comentado) por uno con
# ["Español", "es"], para que MessageTypes.load_message_files("es") se llame
# automaticamente al arrancar (ver StartGame#set_up_system).

require "zlib"

path = "Data/Scripts.rxdata"
raw = Marshal.load(File.binread(path))

TARGET_ID = 557516  # Settings
OLD_BLOCK = "  LANGUAGES = [\r\n#    [\"English\", \"english\"],\r\n#    [\"Deutsch\", \"deutsch\"]\r\n  ]"
NEW_BLOCK = "  LANGUAGES = [\r\n    [\"Español\", \"es\"]\r\n  ]"

found = false
new_raw = raw.map do |id, name, compressed|
  if id == TARGET_ID
    source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
    unless source.include?(OLD_BLOCK)
      raise "No se encontro el bloque LANGUAGES esperado -- abortando sin tocar nada."
    end
    new_source = source.sub(OLD_BLOCK, NEW_BLOCK)
    found = true
    [id, name, Zlib::Deflate.deflate(new_source.b)]
  else
    [id, name, compressed]
  end
end

raise "No se encontro el script Settings (id #{TARGET_ID})" unless found

File.open(path, "wb") { |f| Marshal.dump(new_raw, f) }
puts "LANGUAGES actualizado correctamente."
