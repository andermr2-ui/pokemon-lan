require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  if source =~ /messages_core|messages_game|SCRIPT_TEXTS\s*=|def self\.addMessagesAsHash|def self\.setMapMessagesAsHash|def pbGetMessage|def self\.getMessageFromHash/
    puts "=== #{name} (id #{id}) ==="
    puts source
    puts ""
  end
end
