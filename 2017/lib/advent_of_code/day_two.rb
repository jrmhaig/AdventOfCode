module AdventOfCode
  module DayTwo
    def self.checksum sheet, method
      sheet.map { |line| self.checkline(line, method) }.sum
    end

    def self.checkline line, method
      numbers = line.split(/\s+/).map(&:to_i)
      case method
      when :minmax
        numbers.max - numbers.min
      when :evendividers
        numbers.map do |i|
          (numbers - [i]).select { |j| j % i == 0 }.each do |k|
            # This assumes that there will be only one such pair in the line
            return k / i
          end
        end
      end
    end

    def self.evenly_divides? a, b
      b % a == 0
    end
  end
end
