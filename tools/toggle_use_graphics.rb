# Cambia USE_GRAPHICS de true a false en Battle_Scene_Menus, para que los
# botones de combate (Fight/Bag/Pokemon/Run) se dibujen como texto real
# (traducible) en vez de recortarse de una imagen sprite-sheet.

require "zlib"

path = "Data/Scripts.rxdata"
raw = Marshal.load(File.binread(path))

TARGET_ID = 160373  # Battle_Scene_Menus
OLD_TEXT = "  USE_GRAPHICS = true\r\n"
NEW_TEXT = "  USE_GRAPHICS = false\r\n"

found = false
new_raw = raw.map do |id, name, compressed|
  if id == TARGET_ID
    source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
    count = source.scan(OLD_TEXT).size
    raise "Se esperaba encontrar el texto exactamente 1 vez, se encontro #{count} -- abortando" unless count == 1
    new_source = source.sub(OLD_TEXT, NEW_TEXT)
    found = true
    [id, name, Zlib::Deflate.deflate(new_source.b)]
  else
    [id, name, compressed]
  end
end

raise "No se encontro el script Battle_Scene_Menus (id #{TARGET_ID})" unless found

File.open(path, "wb") { |f| Marshal.dump(new_raw, f) }
puts "USE_GRAPHICS cambiado a false correctamente."
