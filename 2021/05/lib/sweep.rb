require 'map'

class Sweep
  def initialize(*data)
    @data = data
  end

  def call
    map = Map.new
    @data.each { |vent| map.accept(vent) }
    map.count(2)
  end
end
