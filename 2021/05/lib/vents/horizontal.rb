require 'vents/base'

module Vents
  class Horizontal < Base
    def initialize(...)
      super(...)

      (@x_start, @x_end) = [@pos1[0], @pos2[0]].sort
      @y = @pos1[1]
    end

    def update_map(map)
      @x_start.upto(@x_end).each { |x| map.mark(x, @y) }
    end
  end
end
