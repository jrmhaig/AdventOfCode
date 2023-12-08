$LOAD_PATH << File.expand_path('lib', __dir__)

require 'node'
require 'travel'
require 'terminator/human'
require 'terminator/ghost'

(path, node_data) = File.read('input.txt').split(/\n\n/)
directions = path.split(//)

collection = []
node_data.split(/\n/).each do |line|
  match = line.match(/^([A-Z]+) = \(([A-Z]+), ([A-Z]+)\)/)
  collection << Node.new(id: match[1], left: match[2], right: match[3], collection:)
end

location = collection.find { |node| node.id == 'AAA' }
journey = Travel.new(*directions, terminator: Terminator::Human)
puts "Part 1: #{journey.steps(location)}"

locations = collection.select { |node| node.id[2] == 'A' }
journey = Travel.new(*directions, terminator: Terminator::Ghost)
distances = locations.map { |location| journey.steps(location) }
puts "Part 2: #{distances.inject { |mult, distance| mult.lcm(distance) }}"
