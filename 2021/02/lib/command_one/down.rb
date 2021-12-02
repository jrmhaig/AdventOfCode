module CommandOne
  class Down
    NAME = 'down'

    def initialize(sub, distance)
      @sub = sub
      @distance = distance
    end

    def call
      @sub.depth += @distance
    end
  end
end
