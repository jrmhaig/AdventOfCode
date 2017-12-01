module AdventOfCode
  module DayOne
    def self.captcha1 code
      self.captcha code, 1
    end

    def self.captcha2 code
      self.captcha code, code.length / 2
    end

    private

    def self.captcha code, rotation
      digits = code.split(//).map(&:to_i)
      sum = 0
      digits.each_with_index do |n, i|
        sum += n if digits[(i + rotation) % digits.length] == n
      end
      sum
    end
  end
end
