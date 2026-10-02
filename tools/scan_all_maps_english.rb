# encoding: UTF-8
require_relative "rpg_stubs"

ENGLISH_WORDS = %w[the you your and is are this have will can not with for from
  what where when who why how they them their there here going gonna dont
  cant wont its it´s that´s youre don´t won´t]

Dir.glob("Data/Map*.rxdata").sort.each do |path|
  n = File.basename(path)[/\d+/].to_i
  m = Marshal.load(File.binread(path))
  hits = []
  m.events.each_value do |ev|
    ev.pages.each do |pg|
      pg.list.each do |cmd|
        next unless cmd.code == 101 || cmd.code == 401
        t = cmd.parameters[0]
        next unless t && !t.empty?
        t = t.dup.force_encoding("UTF-8")
        words = t.downcase.scan(/[a-z´']+/)
        count = words.count { |w| ENGLISH_WORDS.include?(w) }
        hits << t if count >= 2
      end
    end
  end
  next if hits.empty?
  puts "=== map#{n} (#{hits.size} lineas sospechosas) ==="
  hits.first(3).each { |h| puts "  #{h[0,100].inspect}" }
end
