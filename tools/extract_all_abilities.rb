content = File.read("PBS/abilities.txt", encoding: "UTF-8")
File.open("tools/_abilities_pairs.txt", "w:UTF-8") do |out|
  content.split(/^#-+\r?\n/).each do |block|
    next unless block =~ /^Name = (.+?)\r?$/
    name = $1.strip
    desc = block[/^Description = (.+?)\r?$/, 1]
    out.puts "#{name}|||#{desc}"
  end
end
puts "listo"
