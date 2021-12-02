module CommandTwo
  class Up
    NAME = 'up'

    def initialize(sub, distance)
      @sub = sub
      @distance = distance
    end

    def call
      @sub.aim -= @distance
    end
  end
end
