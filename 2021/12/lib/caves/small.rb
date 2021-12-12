require 'caves/base'

module Caves
  class Small < Base
    def available
      @traveller.can_revisit_small_cave || !@visited
    end

    def visit
      @traveller.revisit_small_cave if @visited
      @visited = true
    end
  end
end
