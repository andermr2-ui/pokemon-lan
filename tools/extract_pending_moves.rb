data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
pending_names = data[5].select { |k,v| k == v }.keys

files = ["PBS/moves.txt", "PBS/moves_Gen_9_Pack.txt", "PBS/moves_zpower.txt"]
found = {}
files.each do |f|
  next unless File.exist?(f)
  content = File.read(f, encoding: "UTF-8")
  content.split(/^#-+\n/).each do |block|
    next unless block =~ /^Name = (.+)$/
    name = $1.strip
    if pending_names.include?(name)
      desc = block[/^Description = (.+)$/, 1]
      found[name] = desc
    end
  end
end

puts "Encontradas: #{found.size} de #{pending_names.size}"
missing = pending_names - found.keys
puts "NO encontradas: #{missing.join(', ')}" unless missing.empty?

File.open("tools/_pending_moves_data.txt", "w:UTF-8") do |out|
  found.each { |name, desc| out.puts "#{name}|||#{desc}" }
end
