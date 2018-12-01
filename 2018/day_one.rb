changes = File.read('day_one_input.txt').split(/\n/).map(&:to_i)

puts "Part one: #{changes.sum}"

collection = [0]
while collection.count(collection[-1]) <= 1
  i = changes.shift
  collection << collection[-1] + i
  changes << i
end
puts "Part two: #{collection[-1]}"
