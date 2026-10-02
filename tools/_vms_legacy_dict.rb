# encoding: UTF-8
require_relative "vms_english_texts"

# Traducciones adicionales (fuera de las 65 constantes) tocadas en esta
# misma tanda de "limpieza VMS": strings dentro de metodos (seguros, no
# constantes) que tambien estaban en espanol hardcodeado.
EXTRA_VMS_DICT = {
  "Confirm Trade" => "Confirmar Intercambio",
  "View my Pokémon" => "Ver mis Pokémon",
  "View {1}'s Pokémon" => "Ver los Pokémon de {1}",
  "Error saving." => "Error al guardar.",
  "Local Play" => "Juego Local",
  "Online Play" => "Juego Online",
  "Choose a game mode:" => "Elige un modo de juego:",
  "Host Game" => "Crear Partida",
  "Join Server" => "Unirse a Servidor",
  "Enter the server's IPv4 address" => "Introduce la IPv4 del servidor",
  "Create Cluster" => "Crear Clúster",
  "Browse Clusters" => "Explorar Clústeres",
  "Cluster {1} ({2}/4 players)" => "Clúster {1} ({2}/4 jugadores)",
  "Waiting for {1} to select Pokémon..." => "Esperando a que {1} seleccione Pokémon...",
  "An error occurred: {1}" => "Ha ocurrido un error: {1}",
  "{1} has disconnected..." => "{1} se ha desconectado...",
  "You have disconnected..." => "Te has desconectado...",
  "Waiting for {1} to select a new Pokémon..." => "Esperando a que {1} seleccione un nuevo Pokémon...",
  "{1} has given up." => "{1} se ha rendido.",
  "Waiting for {1} to select a move..." => "Esperando a que {1} seleccione un movimiento...",
  "{1} has disconnected." => "{1} se ha desconectado.",
  "Waiting for {1}..." => "Esperando a {1}...",
}.freeze

ALL = {}
VMS_CONST_ENGLISH.each { |_name, (_en_args, spanish)| }  # no-op, placeholder
# Para las 65 constantes, la clave real usada por _INTL es el texto INGLES
# (primer valor entre comillas dentro de en_args). Como en_args puede tener
# argumentos extra (INTERACTION_BATTLE_MESSAGE), extraemos solo el primer
# string literal.
VMS_CONST_ENGLISH.each_value do |(en_args, spanish)|
  # en_args es algo como: '"texto en ingles"' o '"texto", "{1}", "{2}"'
  # el primer argumento entre comillas es la clave real de _INTL.
  m = en_args.match(/\A"((?:[^"\\]|\\.)*)"/)
  next unless m
  key = eval('"' + m[1] + '"')  # des-escapa \\ -> \, etc via eval controlado (input propio, no de usuario)
  ALL[key] = spanish
end
EXTRA_VMS_DICT.each { |en, es| ALL[en] = es }

puts "total a insertar: #{ALL.size}"

dicts = []
["Data/messages_es_game.dat", "Data/messages_es_core.dat"].each do |f|
  d = Marshal.load(File.binread(f)) rescue next
  d.each { |s| dicts << s if s.is_a?(Hash) }
end
conflicts = []
ALL.each do |en, es|
  dicts.each do |section|
    next unless section.key?(en)
    existing = section[en]
    conflicts << [en, es, existing] if existing != es && existing != en
  end
end
if conflicts.empty?
  puts "sin conflictos"
else
  puts "CONFLICTOS:"
  conflicts.each { |en, es, existing| puts "  #{en.inspect}\n    nuevo: #{es.inspect}\n    ya existia: #{existing.inspect}" }
end

File.write("tools/_vms_legacy_all.marshal", Marshal.dump(ALL)) if conflicts.empty?
