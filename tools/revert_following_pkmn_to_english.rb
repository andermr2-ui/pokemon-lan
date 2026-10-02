# encoding: UTF-8
# Revierte los 3 archivos de "Pokemon que te sigue" a texto INGLES (el
# original, key de _INTL), preparando el terreno para registrar el
# espanol como traduccion real en el diccionario (messages_es_game.dat)
# en vez de tenerlo hardcodeado en el .rb. Devuelve tambien el mapa
# INGLES => ESPAÑOL final (con los 3 casos ambiguos ya resueltos a mano)
# para usarlo al poblar el diccionario.
require_relative "translations_following_pkmn"

TARGET_FILES = [
  "Plugins/Following Pokemon EX/Configuration/002_Dialogue_Specific.rb",
  "Plugins/Following Pokemon EX/Configuration/003_Dialogue_Generic.rb",
  "Plugins/Following Pokemon EX/Main Module/Internal Commands.rb",
].freeze

# value espanol -> lista de claves inglesas candidatas (en el orden en que
# hay que usarlas, primera ocurrencia = primera clave, etc.), SOLO para los
# 3 casos ambiguos detectados.
AMBIGUOUS_ORDER = {
  "{1} mira fijo hacia la distancia." => [
    "{1} is staring off into the distance.",       # ellipses_generic (003, primero)
    "{1} is staring intently into the distance.",  # generic sin animacion (003, segundo)
  ],
  "\\me[{1}]¡{3} encontró \\c[1]{2}\\c[0]!\\wtnp[30]" => [
    "\\me[{1}]{3} found \\c[1]{2}\\c[0]!\\wtnp[30]",     # DNASPLICERS
    "\\me[{1}]{3} found an \\c[1]{2}\\c[0]!\\wtnp[30]",  # empieza con vocal
    "\\me[{1}]{3} found a \\c[1]{2}\\c[0]!\\wtnp[30]",   # empieza con consonante
  ],
  "¡{1} encontró \\c[1]{2}\\c[0]!\\wtnp[30]" => [
    "{1} found \\c[1]{2}\\c[0]!\\wtnp[30]",     # DNASPLICERS (mochila llena)
    "{1} found an \\c[1]{2}\\c[0]!\\wtnp[30]",  # vocal (mochila llena)
    "{1} found a \\c[1]{2}\\c[0]!\\wtnp[30]",   # consonante (mochila llena)
  ],
}.freeze

# Construir el reverso simple para los casos NO ambiguos.
reverse_simple = {}
TRANSLATIONS.each do |en, es|
  next if AMBIGUOUS_ORDER.key?(es)
  reverse_simple[es] = en
end

ambiguous_counters = Hash.new(0)
final_en_to_es = TRANSLATIONS.dup  # ya esta bien armado en sentido ingles->espanol

total_reverted = 0
TARGET_FILES.each do |file|
  src = File.read(file, encoding: "UTF-8")
  changed = 0
  new_src = src.gsub(/_INTL\(\s*("(?:\\.|[^"\\])*")/m) do |match|
    lit = $1
    val = begin
      eval(lit)
    rescue StandardError
      next match
    end
    if AMBIGUOUS_ORDER.key?(val)
      idx = ambiguous_counters[val]
      ambiguous_counters[val] += 1
      english = AMBIGUOUS_ORDER[val][idx]
      raise "sin candidato ingles para ocurrencia ##{idx} de #{val.inspect} en #{file}" if !english
      changed += 1
      total_reverted += 1
      "_INTL(#{english.dump}"
    elsif reverse_simple.key?(val)
      changed += 1
      total_reverted += 1
      "_INTL(#{reverse_simple[val].dump}"
    else
      match  # no es uno de los strings que tradujimos, dejar igual
    end
  end
  File.write(file, new_src)
  puts "#{file}: #{changed} revertidos a ingles"
end

puts "TOTAL revertidos: #{total_reverted}"
puts "contadores ambiguos: #{ambiguous_counters.inspect}"

# Guardar el mapa final ingles->espanol (con conflictos ya resueltos) para
# el siguiente paso (poblar el diccionario).
File.open("tools/_following_pkmn_final_dict.rb", "w") do |f|
  f.puts "# encoding: UTF-8"
  f.puts "FOLLOWING_PKMN_DICT = {"
  final_en_to_es.each do |en, es|
    f.puts "  #{en.dump} => #{es.dump},"
  end
  f.puts "}.freeze"
end
puts "Diccionario final guardado en tools/_following_pkmn_final_dict.rb (#{final_en_to_es.size} entradas)"
