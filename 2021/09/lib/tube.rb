class Tube
  attr_accessor :neighbours
  attr_reader :height

  def initialize(height)
    @height = height.to_i
    @neighbours = []
  end

  def minimum? = @neighbours.select { |n| @height >= n.height }.empty?

  def risk = @height + 1

  def neighbours_in_basin = @neighbours.select { |t| t && t.height < 9 }
end
