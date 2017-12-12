module AdventOfCode
  class DayTwelve
    def initialize *data
      @data = {}
      data.each do |line|
        from, to = line.split('<->')
        @data[from.to_i] = to.split(',').map(&:to_i)
      end
    end

    def group n
      found = []
      to_follow = [n]
      while to_follow.length > 0
        new_to_follow = []
        to_follow.each do |i|
          found << i
          new_to_follow += (@data[i] - found)
        end
        to_follow = new_to_follow
      end
      found.uniq
    end
  end
end
