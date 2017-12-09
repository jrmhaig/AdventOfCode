module AdventOfCode
  module DayNine
    def self.score stream
      in_garbage = false
      ignore_next = false
      level = 0
      stream.split(//).inject(0) do |score, char|
        if ignore_next
          ignore_next = false
        elsif char == '!'
          ignore_next = true
        elsif in_garbage
          in_garbage = (char != '>')
        elsif char == '<'
          in_garbage = true
        elsif char == '{'
          level += 1
        elsif char == '}'
          score += level
          level -= 1
        end
        score
      end
    end
  end
end
