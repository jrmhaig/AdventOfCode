require 'matrix'

class BeamHead
  attr_reader :position, :direction

  MIRRORS = {
    '/' => Matrix[[0, -1], [-1, 0]],
    '\\' => Matrix[[0, 1], [1, 0]],
  }

  def initialize(position, direction)
    @position = Vector[*position]
    @direction = Vector[*direction]
  end

  def ==(other)
    @position == other.position && @direction == other.direction
  end

  def reflect(mirror)
    @direction = MIRRORS[mirror] * @direction
  end
end
