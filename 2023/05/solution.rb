$LOAD_PATH << File.expand_path('lib', __dir__)

require 'mapper'
require 'rule_maker/forward'
require 'rule_maker/backward'

input = File.read('input.txt').split(/\n\n/)

seeds = input.shift.gsub(/seeds:\s*/, '').split(/\s+/).map(&:to_i)

following = nil
rule_maker = RuleMaker::Forward
part_one_maps = input.reverse.each_with_object({}) do |map_data, result|
  lines = map_data.split(/\n/)
  following = Mapper.new(*lines[1..].map { |line| line.split.map(&:to_i) }, following:, rule_maker:)
  result[lines[0].split(/-/)[0]] = following
end

lowest = seeds.map { |seed| part_one_maps['seed'].map(seed) }.min
puts "Part 1: #{lowest}"

# Part 2. Instead of testing all of the seed numbers and then getting the
# smallest location number it is possible to start counting up from zero for a
# location number and then work back to get the corresponding seed number and
# check if it is in one of the ranges.
following = nil
rule_maker = RuleMaker::Backward
part_two_maps = input.each_with_object({}) do |map_data, result|
  lines = map_data.split(/\n/)
  following = Mapper.new(*lines[1..].map { |line| line.split.map(&:to_i) }, following:, rule_maker:)
  result[lines[0].split(/-/)[0]] = following
end
seed_ranges = seeds.each_slice(2).map { |start, length| (start..start+length-1) }
searching = true
i = 0
while searching
  j = part_two_maps['humidity'].map(i)
  seed_ranges.each do |range|
    if range.include?(j)
      puts "Part 2: #{i}"
      searching = false
    end
  end
  i += 1
end