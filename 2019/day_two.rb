$LOAD_PATH << File.expand_path('lib', __dir__)
require 'day_two'

data = File.read('inputs/day_two_input.txt').split(",").map(&:to_i)
data[1] = 12
data[2] = 2
computer = DayTwo.new(*data)
computer.run
puts "Part one: #{computer.state[0]}"

10000.times do |inputs|
  data = File.read('inputs/day_two_input.txt').split(",").map(&:to_i)
  data[1] = inputs / 100
  data[2] = inputs % 100
  computer = DayTwo.new(*data)
  computer.run
  if computer.state[0] == 19690720
    puts "Part two: #{inputs}"
    break
  end
end
