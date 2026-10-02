require_relative "rpg_stubs"
maps = %w[009 024 036 043 050 053 054 055 056 057 058 059 060 061 062 063 065 067 072 075 078 087 092 093 115 116 127 138 144 154 157 164 173 177 184 194 196 207 210 213 216 222 232 233 246 257 263 267 269 303 305 310 311 314 315 323 325 328 350 351 360 031]
ok = 0
maps.each do |n|
  path = "Data/Map#{n}.rxdata"
  next unless File.exist?(path)
  begin
    m = Marshal.load(File.binread(path))
    ok += 1
  rescue => e
    puts "FALLO #{path}: #{e.message}"
  end
end
puts "verificados OK: #{ok}/#{maps.size}"
