$LOAD_PATH << File.expand_path('lib', __dir__)

require 'node'

maze = File.read('input.txt').split(/\n/)

nodes = []
maze.each_with_index do |row, y|
  row.split(//).each_with_index do |mark, x|
    Node.new(x, y, mark, nodes:)
  end
end

start = nodes.find { |node| node.mark == 'S' }

(left, right) = start.neighbours
left_route = [start, start.neighbours.first]
right_route = [start, start.neighbours.last]
while left_route.last != right_route.last
  left_route << (left_route.last.neighbours - left_route).first
  right_route << (right_route.last.neighbours - right_route).first
end

puts "Part 1: #{left_route.count - 1}"
