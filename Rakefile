desc "Print out all the answers"
task :answers do
  $LOAD_PATH.unshift('lib')
  %w(mark_i mark_ii mark_iv).each {|x| require x }

  puts MarkI.new.encode("Strong NE Winds!", 6).inspect
  puts MarkII.new.encode('The Desert Fox will move 30 tanks to Calais at dawn', 9, 3).inspect
  puts MarkIV.new.encode('The white cliffs of Alghero are visible at night', 4, 7).inspect
  puts MarkIV.new.decode(%{WZyDsL3u'0TfxP06RtSSF 'DbzhdyFIAu2 zF f5KE"SOQTNA8A"NCKPOKG5D9GSQE'M86IGFMKE6'K4pEVPK!bv83I}, 7, 2).inspect
end
