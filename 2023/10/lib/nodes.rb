require 'forwardable'

class Nodes
  extend Forwardable
  include Enumerable

  def_delegator :@nodes, :each
  attr_reader :x_min, :x_max, :y_min, :y_max

  def initialize
    @nodes = []
    @indexed = {}
  end

  def <<(node)
    @nodes << node
    @indexed[node.x] ||= {}
    @indexed[node.x][node.y] = node
    @x_min = @x_min.nil? ? node.x : [node.x, @x_min].min
    @x_max = @x_max.nil? ? node.x : [node.x, @x_max].max
    @y_min = @y_min.nil? ? node.y : [node.y, @y_min].min
    @y_max = @y_max.nil? ? node.y : [node.y, @y_max].max
  end

  def scan(node, x_diff, y_diff)
    selection = []
    x = node.x
    y = node.y
    x += x_diff
    y += y_diff
    while @indexed[x] && @indexed[x][y]
      if @indexed[x][y].mark == '.'
        selection << @indexed[x][y]
      else
        return selection
      end
      x += x_diff
      y += y_diff
    end
    selection.empty? ? nil : selection
  end
end
