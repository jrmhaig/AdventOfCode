$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_seventeen'

spinlock = AdventOfCode::DaySeventeen.new 348
puts "Part one: #{spinlock.run 2017}"

spinlock.pointer 50000000
puts "Part two: #{spinlock.pointers.rindex(1)}"
