require 'vents/base'

module Vents
  class Vertical < Base
    def initialize(...)
      super(...)

      @x = @pos1[0]
      (@y_start, @y_end) = [@pos1[1], @pos2[1]].sort
    end

    def update_map(map)
      @y_start.upto(@y_end).each { |y| map.mark(@x, y) }
    end
  end
end
