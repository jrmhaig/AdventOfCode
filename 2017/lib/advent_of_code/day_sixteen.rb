module AdventOfCode
  class DaySixteen
    def initialize dancers
      @dancers = dancers
    end

    def dance *moves
      moves.each { |move| step move }
    end

    def step move
      if match = /^s(\d+)$/.match(move)
        @dancers.rotate!(-match[1].to_i)
      elsif match = /^x(\d+)\/(\d+)$/.match(move)
        first = @dancers[match[1].to_i]
        @dancers[match[1].to_i] = @dancers[match[2].to_i]
        @dancers[match[2].to_i] = first
      elsif match = /^p(\w)\/(\w)$/.match(move)
        first = @dancers.index(match[1])
        @dancers[@dancers.index(match[2])] = match[1]
        @dancers[first] = match[2]
      end
    end

    def order
      @dancers.join
    end
  end
end
