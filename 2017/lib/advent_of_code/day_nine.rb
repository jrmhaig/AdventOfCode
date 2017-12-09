module AdventOfCode
  class DayNine
    attr_reader :score, :garbage_count

    def initialize stream
      in_garbage = false
      ignore_next = false
      level = 0
      @score = 0
      @garbage_count = 0
      stream.split(//).each do |char|
        if ignore_next
          ignore_next = false
        elsif char == '!'
          ignore_next = true
        elsif in_garbage
          if char == '>'
            in_garbage = false
          else
            @garbage_count += 1
          end
        elsif char == '<'
          in_garbage = true
        elsif char == '{'
          level += 1
        elsif char == '}'
          @score += level
          level -= 1
        end
      end
    end
  end
end
