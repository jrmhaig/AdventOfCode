$LOAD_PATH << File.expand_path('lib', __dir__)

require 'universe'

data = File.read('input.txt').split(/\n/)

universe = Universe.new(data.first.length, data.length)

data.each_with_index do |row, y|
  row.split(//).each_with_index do |point, x|
    universe.add_galaxy(x, y) if point == '#'
  end
end

universe.age = 1
path_sum = universe.galaxies.combination(2).map { |a, b| universe.distance(a, b) }.sum
puts "Part 1: #{path_sum}"

universe.age = 999_999
path_sum = universe.galaxies.combination(2).map { |a, b| universe.distance(a, b) }.sum
puts "Part 2: #{path_sum}"
