$LOAD_PATH << File.expand_path('lib', __dir__)

require 'engine'
require 'scan'

input = File.read('input.txt').split(/\n/)

engine = Engine.new(*input, scanner: Scan)

part_1 = engine.sum
puts "Part 1: #{part_1}"
