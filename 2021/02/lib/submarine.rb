class Submarine
  attr_accessor :horizontal, :depth, :aim

  def initialize
    @horizontal = 0
    @depth = 0
    @aim = 0
  end

  def solution
    @horizontal * @depth
  end
end
