require "zlib"
Dir.glob("Plugins/Voltseon's Multiplayer Solution/**/*.rb").each do |f|
  src = File.read(f, encoding: "UTF-8")
  src.each_line.with_index do |l, i|
    if l =~ /"name"\s*=>/ || l =~ /MENU_NAME\s*=/
      puts "#{f}:#{i+1}: #{l.strip}"
    end
  end
end
