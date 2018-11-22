module AdventOfCode
  module DayOne
    def self.travel pattern
      pattern.count('(') - pattern.count(')')
    end
  end
end
