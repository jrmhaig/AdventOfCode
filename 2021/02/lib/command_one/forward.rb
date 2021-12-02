module CommandOne
  class Forward
    NAME = 'forward'

    def initialize(sub, distance)
      @sub = sub
      @distance = distance
    end

    def call
      @sub.horizontal += @distance
    end
  end
end
