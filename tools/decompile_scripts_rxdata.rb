require "zlib"

path = ARGV[0] || "Data/Scripts.rxdata"
out  = ARGV[1] || "C:/Users/xarls/AppData/Local/Temp/claude/C--claudecode/f15f54eb-acdd-421b-8543-050656a48be6/scratchpad/scripts_dump.txt"

scripts = Marshal.load(File.binread(path))
File.open(out, "w:UTF-8") do |f|
  scripts.each do |id, name, data|
    src = Zlib::Inflate.inflate(data).force_encoding("UTF-8")
    f.puts "##### SCRIPT #{id}: #{name} #####"
    f.puts src
    f.puts
  end
end
puts "wrote #{out} (#{scripts.size} scripts)"
