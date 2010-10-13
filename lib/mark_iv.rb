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
    algorithm(message,
      :char_maps => maps(wheel_positions),
      :prev_char => lambda {|before, after| before }
    )
  end

  def decode(message, *wheel_positions)
    algorithm(message,
      :char_maps => maps(wheel_positions, -1).reverse,
      :prev_char => lambda {|before, after| after }
    )
  end

  private
    def algorithm(message, config)
      prev = "0"
      message.chars.map do |char|
        config[:char_maps].inject(char) do |c, map|
          map[prev][c]
        end.tap {|c| prev = config[:prev_char][char, c] }
      end.join
    end

    # Note: this method should be memoized if speed optimization is required
    def character_map(position) 
      @character_map ||= {}
      @character_map[position] ||= CHARACTER_SET.each_with_index.inject({}) do |hash, (char, index)|
        offset = (index + position) % CHARACTER_SET.length
        hash[char] = CHARACTER_SET[offset]
        hash
      end
    end

    # Note: this method should be memoized if speed optimization is required
    def maps(wheel_positions, modifier = 1)
      maps = []
      maps[0] = lambda {|c| character_map(wheel_positions[0] * modifier) }
      maps[1] = lambda {|c| character_map(wheel_positions[1] * -2 * modifier) }
      maps[2] = lambda {|c| character_map(2 * CHARACTER_SET.index(c) * modifier) }
      maps
    end
end
