class Node
  attr_reader :id

  def initialize(id:, left:, right:, collection:)
    @id = id
    @left_id = left
    @right_id = right
    @collection = collection
  end

  def go(direction)
    case direction
    when 'L'
      left
    when 'R'
      right
    end
  end

  private
  def left = @left ||= @collection.find { |node| node.id == @left_id }
  def right = @right ||= @collection.find { |node| node.id == @right_id }
end
