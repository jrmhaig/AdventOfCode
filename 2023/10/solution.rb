$LOAD_PATH << File.expand_path('lib', __dir__)

require 'node'
require 'nodes'

maze = File.read('input.txt').split(/\n/)

nodes = Nodes.new()
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

route = left_route + right_route[..-2].reverse
nodes.each { |node| node.mark = '.' unless route.include?(node) }

possible_enclosures = { left: [], right: [] }
route.each_cons(2) do |a, b|
  if possible_enclosures[:left]
    scanned_one = nodes.scan(a, b.y - a.y, a.x - b.x)
    scanned_two = nodes.scan(b, b.y - a.y, a.x - b.x)
    if scanned_one.nil? || scanned_two.nil?
      possible_enclosures[:left] = nil
    else
      possible_enclosures[:left] += scanned_one + scanned_two
      possible_enclosures[:left].uniq!
    end
  end

  if possible_enclosures[:right]
    scanned_one = nodes.scan(a, a.y - b.y, b.x - a.x)
    scanned_two = nodes.scan(b, a.y - b.y, b.x - a.x)
    if scanned_one.nil? || scanned_two.nil?
      possible_enclosures[:right] = nil
    else
      possible_enclosures[:right] += scanned_one + scanned_two
      possible_enclosures[:right].uniq!
    end
  end
end

if possible_enclosures[:left].nil? || possible_enclosures[:left].select(&:edge).any?
  puts "Part 2: #{possible_enclosures[:right].count}"
else
  puts "Part 2: #{possible_enclosures[:left].count}"
end
