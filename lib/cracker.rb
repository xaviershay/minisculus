require 'mark_iv'

class Cracker
  def crack(message, clue_words)
    possible_positions.map do |x|
      possible_positions.map do |y|
        decoded = machine.decode(message, x, y)

        if clue_words.any? {|word| decoded.include?(word)}
          {:message => decoded, :positions => [x, y]} 
        end
      end
    end.flatten.compact
  end

  private

    def machine
      @machine ||= MarkIV.new
    end

    def possible_positions
      @possible_positions ||= (0...MarkIV::CHARACTER_SET.length)
    end
end
