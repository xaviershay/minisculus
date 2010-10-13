desc "Print out all the answers"
task :answers do
  $LOAD_PATH.unshift('lib')
  %w(mark_i mark_ii mark_iv cracker).each {|x| require x }

  require 'pp'
  puts MarkI.new.encode("Strong NE Winds!", 6).inspect
  puts MarkII.new.encode('The Desert Fox will move 30 tanks to Calais at dawn', 9, 3).inspect
  puts MarkIV.new.encode('The white cliffs of Alghero are visible at night', 4, 7).inspect
  puts MarkIV.new.decode(%{WZyDsL3u'0TfxP06RtSSF 'DbzhdyFIAu2 zF f5KE"SOQTNA8A"NCKPOKG5D9GSQE'M86IGFMKE6'K4pEVPK!bv83I}, 7, 2).inspect
  result = Cracker.new.crack(%{QT4e8MJYVhkls.27BL9,.MSqYSi'IUpAJKWg9Ul9p4o8oUoGy'ITd4d0AJVsLQp4kKJB2rz4dxfahwUa"Wa.MS!k4hs2yY3k8ymnla.MOTxJ6wBM7sC0srXmyAAMl9t"Wk4hs2yYTtH0vwUZp4a"WhB2u,o6.!8Zt"Wf,,eh5tk8WXv9UoM99w2Vr4!.xqA,5MSpWl9p4kJ2oUg'6evkEiQhC'd5d4k0qA'24nEqhtAQmy37il9p4o8vdoVr!xWSkEDn?,iZpw24kF"fhGJZMI8nkI}, %w(FURLIN BUNKER))
  puts result.first[:message]
  puts result.map {|x| x[:positions].join(", ") }
end
