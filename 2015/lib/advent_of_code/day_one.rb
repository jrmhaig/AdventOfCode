module AdventOfCode
  module DayOne
    def self.travel pattern
      self.journey(pattern).last
    end

    def self.journey pattern
      position = 0
      pattern.split(//).map do |x|
        position += x == '(' ? 1 : -1
      end
    end
  end
end
