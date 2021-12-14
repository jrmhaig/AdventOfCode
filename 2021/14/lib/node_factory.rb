require 'node'

class NodeFactory
  def initialize
    @nodes = {}
  end

  def fetch(a, b, c=nil)
    @nodes[a + b] ||= Node.new(a, b, c, factory: self)
  end
end
