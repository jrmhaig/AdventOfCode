$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_three'

puts "Part one: #{AdventOfCode::DayThree.new.manhattan 289326}"
memory = AdventOfCode::DayThree.new

memory.set 1, 1
last = 1
i = 2
while last <= 289326
  pos = memory.mpos i
  last = [
    memory.memory_index([pos[0], pos[1]-1]),
    memory.memory_index([pos[0], pos[1]+1]),
    memory.memory_index([pos[0]-1, pos[1]]),
    memory.memory_index([pos[0]+1, pos[1]]),
    memory.memory_index([pos[0]+1, pos[1]+1]),
    memory.memory_index([pos[0]+1, pos[1]-1]),
    memory.memory_index([pos[0]-1, pos[1]+1]),
    memory.memory_index([pos[0]-1, pos[1]-1]),
  ].map { |i| memory.get i }.sum
  memory.set i, last
  #puts "#{i} #{last}"
  i = i + 1
end
puts "Part two: #{last}"
