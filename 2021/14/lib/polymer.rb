require 'hash_sums'

class Polymer
  include HashSums

  def initialize(*nodes)
    @left = nodes.first.left
    @right = nodes.last.right
    @nodes = nodes
  end

  def draw(depth)
    @nodes.inject({@left => 1}) { |list, child| add_hashes(list, child.draw(depth)) }
  end
end
