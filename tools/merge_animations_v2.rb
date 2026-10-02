# encoding: UTF-8
# Passthrough stubs: guardan los bytes crudos del formato binario custom
# (_dump/_load) sin interpretarlos, y los devuelven intactos al volcar de
# nuevo. Esto evita el bug de la v1 (usar allocate() vacio corrompia el
# contenido real al re-serializar).
class Table
  def self._load(str)
    obj = allocate
    obj.instance_variable_set(:@__raw, str)
    obj
  end
  def _dump(depth)
    @__raw
  end
end
class Color
  def self._load(str)
    obj = allocate
    obj.instance_variable_set(:@__raw, str)
    obj
  end
  def _dump(depth)
    @__raw
  end
end
class Tone
  def self._load(str)
    obj = allocate
    obj.instance_variable_set(:@__raw, str)
    obj
  end
  def _dump(depth)
    @__raw
  end
end
module RPG
  class AudioFile; end
  class Animation
    attr_reader :id, :name, :frames, :timings
    class Frame
      attr_reader :cell_data, :cell_max
    end
    class Timing; end
  end
end

def raw_bytes_of(obj)
  # Extrae los bytes crudos guardados por el stub, recursivamente, para
  # comparar el contenido real sin depender del layout exacto de Marshal.
  case obj
  when Table, Color, Tone
    obj.instance_variable_get(:@__raw)
  when Array
    obj.map { |x| raw_bytes_of(x) }
  when RPG::Animation
    [obj.id, obj.name, raw_bytes_of(obj.frames), raw_bytes_of(obj.timings)]
  when RPG::Animation::Frame
    [raw_bytes_of(obj.cell_data), obj.cell_max]
  when RPG::Animation::Timing, RPG::AudioFile
    obj.instance_variables.sort.map { |iv| raw_bytes_of(obj.instance_variable_get(iv)) }
  else
    obj
  end
end

theirs_path = ARGV[0]
ours = Marshal.load(File.binread("Data/Animations.rxdata"))
theirs = Marshal.load(File.binread(theirs_path))

raise "esperaba que 1..8 coincidan en nil-ness" unless (1..8).all? { |i| ours[i].nil? == theirs[i].nil? }

merged = ours[0..8] + theirs[9..-1]

# Verificacion semantica de round-trip ANTES de escribir nada: dumpear y
# volver a cargar 'theirs' con estos mismos stubs, y comparar el contenido
# real (bytes crudos de cada Table/Color/Tone, ids, nombres) entre el
# original y el reload. Marshal no garantiza bytes IDENTICOS en la salida
# (por compartir/no-compartir objetos internamente), pero el CONTENIDO
# tiene que ser exactamente igual o abortamos sin tocar el archivo real.
theirs_dump = Marshal.dump(theirs)
theirs_reloaded = Marshal.load(theirs_dump)
if raw_bytes_of(theirs) != raw_bytes_of(theirs_reloaded)
  raise "ABORTADO: el roundtrip semantico de 'theirs' no coincide, no es seguro continuar"
end
puts "Roundtrip semantico verificado OK (mismo contenido real tras dump+load)"

File.open("Data/Animations.rxdata", "wb") { |f| Marshal.dump(merged, f) }
puts "OK: Data/Animations.rxdata actualizado (#{merged.size} elementos, 1-8 sin tocar, 9-30 del plugin)"

# Verificacion final: releer el archivo recien escrito y confirmar que
# los ids/nombres nuevos (9-30) siguen ahi.
final = Marshal.load(File.binread("Data/Animations.rxdata"))
puts "Verificacion final del archivo escrito:"
(9..30).each { |i| puts "  ##{i}: #{final[i] ? final[i].name.inspect : 'nil'}" }
