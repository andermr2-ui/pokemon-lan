src = File.read("tools/_aurora_dump_all.txt")
sections = src.split(/(?=^=== map\d+ ===$)/)
sections.each do |sec|
  next if sec.strip.empty?
  if sec =~ /^=== map(\d+) ===/
    num = $1.rjust(3, "0")
    File.write("tools/_aurora_dump_map#{num}.txt", sec)
  end
end
puts "done"
