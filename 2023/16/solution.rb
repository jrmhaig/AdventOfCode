$LOAD_PATH << File.expand_path('lib', __dir__)

require 'beams'
require 'beam_head'
require 'contraption'

data = File.read('input.txt').chomp.split(/\n/)
contraption = Contraption.new(*data)

head = contraption.travel(BeamHead.new([-1, 0], [1, 0]))
beams = Beams.new(*head, contraption:)

puts "Part 1: #{contraption.illuminate(entry: Vector[0, 0], direction: Vector[1, 0])}"

answers = data.first.length.times.map do |y|
  r = contraption.illuminate(entry: Vector[0, y], direction: Vector[1, 0])
  l = contraption.illuminate(entry: Vector[data.length - 1, y], direction: Vector[-1, 0])
  puts "#{y}: #{r}, #{l}"
  [r, l].max
end

answers += data.first.length.times.map do |x|
  d = contraption.illuminate(entry: Vector[x, 0], direction: Vector[0, 1])
  u = contraption.illuminate(entry: Vector[x, data.first.length - 1], direction: Vector[0, -1])
  puts "#{x}: #{d}, #{u}"
  [d, u].max
end

puts "Part 2: #{answers.max}"
