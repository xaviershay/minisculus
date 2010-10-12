class MarkI
  CHARACTER_SET = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
    ".", ",", "?", "!", "'", "\"", " "
  ]

  def encode(message, position)
    map = character_map(position)
    message.chars.map {|c| map[c] }.join
  end

  private
    def character_map(position) 
      CHARACTER_SET.each_with_index.inject({}) do |hash, (char, index)|
        offset = (index + position) % CHARACTER_SET.length
        hash[char] = CHARACTER_SET[offset]
        hash
      end
    end
end

if __FILE__ == $0
  puts MarkI.new.encode("Strong NE Winds!", 6)
end
