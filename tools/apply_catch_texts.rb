# encoding: UTF-8
# Todo el flujo de "lanzar una Poke Ball / intentar capturar" nunca se
# habia tocado -- pasa en CADA intento de captura de todo el juego,
# maxima prioridad. Script Battle_CatchAndStoreMixin.
DICT = {
  "Add to your party" => "Añadir a tu equipo",
  "Send to a Box" => "Enviar a una Caja",
  "See {1}'s summary" => "Ver el resumen de {1}",
  "Check party" => "Revisar equipo",
  "Where do you want to send {1} to?" => "¿A dónde quieres enviar a {1}?",
  "Choose a Pokémon in your party to send to your Boxes." =>
    "Elige un Pokémon de tu equipo para enviarlo a tus Cajas.",
  "{1} has been sent to Box \"{2}\"." => "{1} fue enviado a la Caja \"{2}\".",
  "{1} has been added to your party." => "{1} se ha añadido a tu equipo.",
  "{1} has been sent to Box \"{2}\"!" => "¡{1} fue enviado a la Caja \"{2}\"!",
  "{1}'s data was added to the Pokédex." => "Los datos de {1} se añadieron a la Pokédex.",
  "{1} threw an {2}!" => "¡{1} lanzó una {2}!",
  "{1} threw a {2}!" => "¡{1} lanzó una {2}!",
  "But there was no target..." => "Pero no había ningún objetivo...",
  "The Trainer blocked your Poké Ball! Don't be a thief!" =>
    "¡El Entrenador bloqueó tu Poké Ball! ¡No seas un ladrón!",
  "Oh no! The Pokémon broke free!" => "¡Oh, no! ¡El Pokémon se liberó!",
  "Aww! It appeared to be caught!" => "¡Vaya! ¡Parecía que iba a ser capturado!",
  "Aargh! Almost had it!" => "¡Aaargh! ¡Casi lo tenía!",
  "Gah! It was so close, too!" => "¡Argh! ¡Y encima estuvo tan cerca!",
  "Gotcha! {1} was caught!" => "¡Ya está! ¡{1} fue capturado!",
}

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[24]
  added = 0
  DICT.each do |k, v|
    added += 1 unless hash.key?(k)
    hash[k] = v
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: nuevas=#{added} total=#{hash.size}"
end
