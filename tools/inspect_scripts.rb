require "zlib"

def load_scripts(path)
  raw = Marshal.load(File.binread(path))
  raw.map do |id, name, compressed|
    name = name.dup.force_encoding("UTF-8")
    source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
    [id, name, source]
  end
end

["Data/Scripts.rxdata", "Data/PluginScripts.rxdata"].each do |path|
  next unless File.exist?(path)
  scripts = load_scripts(path)
  puts "=== #{path}: #{scripts.size} scripts, #{scripts.sum { |_,_,s| s.bytesize }} bytes de fuente ==="
end
