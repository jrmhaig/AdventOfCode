$LOAD_PATH << File.expand_path('lib', __dir__)

require 'row'

memory = {}
data = File.read('input.txt').split(/\n/)
rows = data.map do |row|
  (springs, groups) = row.split(/\s+/)
  Row.new(springs, *groups.split(/,/).map(&:to_i), memory:)
end

total = rows.sum(&:arrangements)
puts "Part 1: #{total}"

data = File.read('input.txt').split(/\n/)
rows = data.map do |row|
  (springs, groups) = row.split(/\s+/)
  Row.new(([springs]*5).join('?'), *(groups.split(/,/).map(&:to_i)*5), memory:)
end

total = rows.sum(&:arrangements)
puts "Part 1: #{total}"
