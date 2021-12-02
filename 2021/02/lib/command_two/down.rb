module CommandTwo
  class Down
    NAME = 'down'

    def initialize(sub, distance)
      @sub = sub
      @distance = distance
    end

    def call
      @sub.aim += @distance
    end
  end
end
