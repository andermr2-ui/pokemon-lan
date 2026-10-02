require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  if source =~ /load_message_files|AVAILABLE_LANGUAGES|LANGUAGES\s*=|\.language\s*=|setLanguage/i
    puts "=== #{name} (id #{id}) ==="
    source.lines.each_with_index do |l, i|
      puts "#{i+1}: #{l}" if l =~ /load_message_files|AVAILABLE_LANGUAGES|LANGUAGES\s*=|\.language\s*=|setLanguage|def.*[Ll]anguage/
    end
  end
end
