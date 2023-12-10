class Node
  attr_accessor :mark
  attr_reader :x, :y

  def initialize(x, y, mark, nodes:)
    @x = x
    @y = y
    @mark = mark
    @nodes = nodes
    @nodes << self
  end

  def neighbours
    @meighbours ||= case @mark
                    when '-'
                      @nodes.select { |node| [@x - 1, @x + 1].include?(node.x) && node.y == @y }
                    when '|'
                      @nodes.select { |node| [@y - 1, @y + 1].include?(node.y) && node.x == @x}
                    when 'J'
                      @nodes.select { |node| (node.x == @x - 1 && node.y == @y) || (node.x == @x && node.y == @y - 1) }
                    when 'L'
                      @nodes.select { |node| (node.x == @x + 1 && node.y == @y) || (node.x == @x && node.y == @y - 1) }
                    when 'F'
                      @nodes.select { |node| (node.x == @x + 1 && node.y == @y) || (node.x == @x && node.y == @y + 1) }
                    when '7'
                      @nodes.select { |node| (node.x == @x - 1 && node.y == @y) || (node.x == @x && node.y == @y + 1) }
                    when 'S'
                      [
                        @nodes.find { |node| node.x == @x - 1 && node.y == @y },
                        @nodes.find { |node| node.x == @x + 1 && node.y == @y },
                        @nodes.find { |node| node.x == @x && node.y == @y - 1 },
                        @nodes.find { |node| node.x == @x && node.y == @y + 1 }
                      ].compact.select { |node| node.neighbours.include?(self) }
                    else
                      []
                    end
  end

  def edge
    (@x == @nodes.x_min || @y == @nodes.y_min || @x == @nodes.x_max || @y == @nodes.y_max)
  end
end
