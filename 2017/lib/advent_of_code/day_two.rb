module AdventOfCode
  module DayTwo
    def self.checksum sheet
      sheet.map { |line| self.checkline line }.sum
    end

    def self.checkline line
      numbers = line.split(/\s+/).map(&:to_i)
      numbers.max - numbers.min
    end

    def self.evenly_divides? a, b
      b % a == 0
    end
  end
end
