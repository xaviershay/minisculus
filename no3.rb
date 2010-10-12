class MarkIV
  CHARACTER_SET = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
    ".", ",", "?", "!", "'", "\"", " "
  ]

  def encode(message, *wheel_positions)
    maps = []
    maps[0] = lambda {|c| character_map(wheel_positions[0]) }
    maps[1] = lambda {|c| character_map(wheel_positions[1] * -2) }
    maps[2] = lambda {|c| character_map(2 * CHARACTER_SET.index(c)) }

    encoded = maps.inject(message) do |msg, map|
      msg.chars.map {|c| map[c][c] }.join
    end
  end

  private
    # Note: this method should be memoized if speed optimization was required
    def character_map(position) 
      CHARACTER_SET.each_with_index.inject({}) do |hash, (char, index)|
        offset = (index + position) % CHARACTER_SET.length
        hash[char] = CHARACTER_SET[offset]
        hash
      end
    end
end

if __FILE__ == $0
  puts MarkIV.new.encode('The white cliffs of Alghero are visible at night', 4, 7)
end
