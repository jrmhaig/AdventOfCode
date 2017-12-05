module AdventOfCode
  module DayFive
    def self.jump part, *data
      i = 0
      count = 0
      while i >= 0 && i < data.length
        inc = data[i]
        if data[i] >= 3
          case part
          when :one
            data[i] += 1
          else
            data[i] -= 1
          end
        else
          data[i] += 1
        end
        i += inc
        count += 1
      end
      count
    end
  end
end
