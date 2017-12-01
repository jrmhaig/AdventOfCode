module AdventOfCode
  module DayOne
    def self.captcha code
      digits = code.split(//).map(&:to_i)
      sum = 0
      digits.each_with_index do |n, i|
        sum += n if digits[(i+1) % digits.length] == n
      end
      sum
    end
  end
end
