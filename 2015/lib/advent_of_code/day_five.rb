module AdventOfCode
  module DayFive
    def self.is_nice? pattern
      pattern.count('aeiou') >= 3 &&
        pattern != pattern.squeeze &&
        /ab|cd|pq|xy/ !~ pattern
    end

    def self.is_really_nice? pattern
      (pattern.size - 1).times.find do |i|
        pattern[i+2..-1].include? pattern[i,2]
      end &&
      (pattern.size - 1).times.find do |i|
        pattern[i+2] == pattern[i]
      end
    end
  end
end
