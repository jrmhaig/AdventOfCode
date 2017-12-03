module AdventOfCode
  module DayThree
    def self.manhattan n
      self.mpos(n).map(&:abs).sum
    end

    def self.mpos n
      return [0, 0] if n == 1

      level = ((Math.sqrt(n).ceil)/2.0).floor
      side = (level * 2)
      max = (((level + 1) * 2) - 1) ** 2
      from_max = max - n
      j = level  - from_max % side
      case from_max / side
      when 0
        y = -level
        x = j
      when 1
        x = -level
        y = -j
      when 2
        y = level
        x = -j
      when 3
        x = level
        y = j
      end

      [x, y]
    end
  end
end
