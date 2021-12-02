module CommandTwo
  class Forward
    NAME = 'forward'

    def initialize(sub, distance)
      @sub = sub
      @distance = distance
    end

    def call
      @sub.horizontal += @distance
      @sub.depth += @sub.aim * @distance
    end
  end
end
