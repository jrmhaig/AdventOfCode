require 'advent_of_code/day_ten'

module AdventOfCode
  module DayFourteen
    def self.used code
      count = 0
      128.times do |i|
        count += AdventOfCode::DayTen.new(
          size: 256,
          inputs: '%s-%d' % [code, i],
          rounds: 64
        ).dense.to_i(16).to_s(2).scan(/1/).count
      end
      count
    end
  end
end
