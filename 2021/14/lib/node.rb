require 'hash_sums'

class Node
  include HashSums

  attr_reader :left, :right

  def initialize(left, right, centre=nil, factory:)
    @left = left
    @right = right
    @centre = centre
    @factory = factory
    @draw = []
  end

  def draw(depth)
    @draw[depth] ||= generate(depth)
  end

  private

  def children
    @children ||= [@factory.fetch(@left, @centre), @factory.fetch(@centre, @right)]
  end

  def first_child
    @first_child ||= @factory.fetch(@left, @centre)
  end

  def second_child
    @second_child ||= @factory.fetch(@centre, @right)
  end

  def generate(depth)
    return [@left, @right].tally if depth == 0 || @centre.nil?

    add_hashes(first_child.draw(depth-1), second_child.draw(depth-1)).tap { |hash| hash[@centre] -= 1 }
  end
end
