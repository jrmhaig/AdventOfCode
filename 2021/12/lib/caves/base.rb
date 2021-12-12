module Caves
  class Base
    attr_reader :id
    attr_accessor :visited

    def initialize(id, traveller:)
      @id = id
      @adjoining = []
      @visited = false
      @traveller = traveller
    end

    def join(other)
      @adjoining << other unless @adjoining.include?(other)
    end

    def options = @adjoining.select(&:available)

    def visit
      @visited = true
    end

    def unvisit
      @visited = false
    end
  end
end
