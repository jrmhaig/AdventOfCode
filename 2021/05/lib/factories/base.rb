module Factories
  class Base
    def create(vent)
      (pos1, pos2) = vent.split(' -> ').map { |pos| pos.split(',').map(&:to_i) }

      klass(pos1, pos2).new(pos1, pos2)
    end
  end
end
