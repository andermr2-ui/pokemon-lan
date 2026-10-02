key_literal = "You put the {1} in\nyour Bag's <icon=bagPocket{2}>\c[1]{3}\c[0] pocket."
key_esc = eval(%q{"You put the {1} in\nyour Bag's <icon=bagPocket{2}>\c[1]{3}\c[0] pocket."})
puts "key_literal: #{key_literal.inspect}"
puts "key_literal bytes: #{key_literal.bytes.inspect}"
puts
puts "key_esc: #{key_esc.inspect}"
puts "key_esc bytes: #{key_esc.bytes.inspect}"
