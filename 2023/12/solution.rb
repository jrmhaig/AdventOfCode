$LOAD_PATH << File.expand_path('lib', __dir__)

require 'row'

data = File.read('input.txt').split(/\n/)
rows = data.map do |row|
  (springs, groups) = row.split(/\s+/)
  Row.new(springs, *groups.split(/,/).map(&:to_i))
end

total = rows.sum(&:arrangements)
puts "Part 1: #{total}"

