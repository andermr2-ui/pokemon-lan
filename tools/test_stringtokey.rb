def stringToKey(str)
  if str && str[/[\r\n\t\1]|^\s+|\s+$|\s{2,}/]
    key = str.clone
    key.gsub!(/^\s+/, "")
    key.gsub!(/\s+$/, "")
    key.gsub!(/\s{2,}/, " ")
    return key
  end
  return str
end

target = eval(%q{"You put the {1} in\nyour Bag's <icon=bagPocket{2}>\c[1]{3}\c[0] pocket."})
normalized = stringToKey(target)
puts "iguales: #{target == normalized}"
puts "target bytes: #{target.bytes.inspect}"
puts "normalized bytes: #{normalized.bytes.inspect}"
