# encoding: UTF-8
data = Marshal.load(File.binread("Data/messages_es_game.dat"))
File.open("tools/_frontier_speeches.tsv", "wb") do |f|
  f.write("cat\tidx\ttexto_en\n".b)
  [15, 16, 17].each do |cat|
    h = data[cat]
    h.each_with_index do |(k, v), i|
      next unless k == v
      line = "#{cat}\t#{i + 1}\t#{k.gsub("\t", " ").gsub("\n", "\\n")}\n"
      f.write(line.encode("UTF-8").b)
    end
  end
end
puts "listo"
