module Travellers
  class Two
    attr_reader :can_revisit_small_cave

    def initialize
      reset
    end

    def reset
      @can_revisit_small_cave = true
    end

    def revisit_small_cave
      @can_revisit_small_cave = false
    end
  end
end
