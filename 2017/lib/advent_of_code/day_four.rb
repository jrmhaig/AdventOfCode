module AdventOfCode
  module DayFour
    def self.validate code
      words = code.split(/\s+/).map do |w|
        w.split(//).sort.join
      end
      words.length == words.uniq.length
    end
  end
end
