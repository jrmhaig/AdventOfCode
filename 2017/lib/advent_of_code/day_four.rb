module AdventOfCode
  module DayFour
    def self.validate code
      words = code.split /\s+/
      words.length == words.uniq.length
    end
  end
end
