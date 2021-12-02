module CommandOne
  class Up
    NAME = 'up'

    def initialize(sub, distance)
      @sub = sub
      @distance = distance
    end

    def call
      @sub.depth -= @distance
    end
  end
end
