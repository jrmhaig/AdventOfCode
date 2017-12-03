module AdventOfCode
  class DayThree
    def initialize
      @data = []
    end

    def manhattan n
      self.mpos(n).map(&:abs).sum
    end

    def mpos n
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

    def memory_index arr
      return 1 if arr == [0, 0]
      level = arr.map(&:abs).max
      index = ((level * 2) - 1) ** 2
      side = (level * 2)
      if level == -arr[1]
        index += 3 * side + level + arr[0]
      elsif level == -arr[0]
        index += 2 * side + level - arr[1]
      elsif level == arr[1]
        index += side + level - arr[0]
      elsif level == arr[0]
        index += level + arr[1]
      end
    end

    def get n
      return 0 if n > @data.length
      @data[n-1]
    end

    def set n, i
      @data[n-1] = i
    end
  end
end
