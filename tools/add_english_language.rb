# encoding: UTF-8
# Agrega "English" como segundo idioma seleccionable (Settings::LANGUAGES).
# Edicion quirurgica a nivel de bytes: NO se decodifica/normaliza el resto
# del archivo (los saltos de linea reales son \r\n simples, no \r\r\n como en
# otras secciones de este proyecto -- verificado byte a byte antes de tocar
# nada). Solo se reemplaza el bloque exacto encontrado.
require "zlib"

data = Marshal.load(File.binread("Data/Scripts.rxdata"))
target_idx = data.index { |id, name, comp| name == "Settings" }
raise "no se encontro la seccion Settings" if !target_idx

id, name, comp = data[target_idx]
raw = Zlib::Inflate.inflate(comp)  # bytes crudos, sin forzar encoding

old = "  LANGUAGES = [\r\n    [\"Espa\xC3\xB1ol\", \"es\"]\r\n  ]".dup.force_encoding("ASCII-8BIT")
new = "  LANGUAGES = [\r\n    [\"Espa\xC3\xB1ol\", \"es\"],\r\n    [\"English\", \"\"]\r\n  ]".dup.force_encoding("ASCII-8BIT")

raw = raw.dup.force_encoding("ASCII-8BIT")
raise "no se encontro el bloque LANGUAGES exacto" if !raw.include?(old)
raw = raw.sub(old, new)

new_comp = Zlib::Deflate.deflate(raw)
data[target_idx] = [id, name, new_comp]

File.open("Data/Scripts.rxdata", "wb") { |f| Marshal.dump(data, f) }
puts "OK: LANGUAGES actualizado (edicion binaria exacta, sin tocar el resto del archivo)"
