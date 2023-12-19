$LOAD_PATH << File.expand_path('lib', __dir__)

require 'beams'
require 'beam_head'
require 'contraption'

contraption = Contraption.new(*File.read('input.txt').chomp.split(/\n/))

head = BeamHead.new([0, 0], [1, 0])
if ['/', '\\'].include?(contraption.at([0, 0]))
  head.reflect(contraption.at([0, 0]))
end
beams = Beams.new(head, contraption:)

puts "Part 1: #{beams.illuminate}"
