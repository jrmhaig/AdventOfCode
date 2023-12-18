$LOAD_PATH << File.expand_path('lib', __dir__)

require 'column'
require 'platform'

rows = File.read('input.txt').split(/\n/)

columns = rows.first.length.times.map do |i|
  Column.new(*rows.map { |row| row[i] })
end

total = columns.sum(&:weight)
puts "Part 1: #{total}"

platform = Platform.new(*rows)
pointer = previous = start = platform.signature
signatures = {previous => { next: nil, weight: 0, i: 0 } }
loop_size = nil
1000000000.times do |i|
  platform.cycle
  pointer = platform.signature
  signatures[previous][:next] = pointer
  if signatures[pointer]
    loop_size = i - signatures[pointer][:i]
    break
  end
  signatures[pointer] = { next: nil, weight: platform.weight, i: }
  previous = pointer 
end

remainder = (1000000000 - signatures[pointer][:i]) % loop_size
(remainder-1).times { pointer = signatures[pointer][:next] }
puts "Part 2: #{signatures[pointer][:weight]}"
