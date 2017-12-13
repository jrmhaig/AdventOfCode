$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_thirteen'

data = File.read('day_thirteen_input.txt').chomp.split(/\n/).map do |line|
  line.split(/:/).map(&:to_i)
end.to_h

firewall = AdventOfCode::DayThirteen.new data

puts "Part one: #{firewall.severity(0)}"

i = 0
while !firewall.safe_path(i)
  i += 1
end

puts "Part two: #{i}"
