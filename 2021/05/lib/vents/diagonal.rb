require 'vents/base'

module Vents
  class Diagonal < Base
    def initialize(...)
      super(...)

      @steps = (@pos1[0] - @pos2[0]).abs + 1
      @x_dir = @pos1[0] > @pos2[0] ? -1 : 1
      @y_dir = @pos1[1] > @pos2[1] ? -1 : 1
    end

    def update_map(map)
      @steps.times do |i|
        map.mark(@pos1[0] + @x_dir * i, @pos1[1] + @y_dir * i)
      end
    end
  end
end
