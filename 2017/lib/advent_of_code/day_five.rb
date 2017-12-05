module AdventOfCode
  module DayFive
    def self.jump *data
      i = 0
      count = 0
      while i >= 0 && i < data.length
        inc = data[i]
        data[i] += 1
        i += inc
        count += 1
      end
      count
    end
  end
end
