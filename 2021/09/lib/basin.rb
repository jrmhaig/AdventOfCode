require 'forwardable'

class Basin
  extend Forwardable

  def_delegator :@tubes, :size

  def initialize(tube)
    @tubes = []
    neighbours = [tube]
    while neighbours.any?
      @tubes += neighbours
      neighbours = @tubes.map(&:neighbours).flatten.uniq - @tubes
    end
  end
end
