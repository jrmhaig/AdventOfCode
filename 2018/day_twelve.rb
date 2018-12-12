#!/usr/bin/env ruby

initial = '##..##....#.#.####........##.#.#####.##..#.#..#.#...##.#####.###.##...#....##....#..###.#...#.#.#.#'
rules_text = <<~RULES
##.#. => .
##.## => .
#..## => .
#.#.# => .
..#.. => #
#.##. => .
##... => #
.#..# => .
#.### => .
..... => .
...#. => #
#..#. => #
###.. => #
.#... => #
###.# => #
####. => .
.##.# => #
#.#.. => #
.###. => #
.#.## => .
##### => #
....# => .
.#### => .
.##.. => #
##..# => .
#...# => .
..### => #
...## => .
#.... => .
..##. => .
.#.#. => #
..#.# => #
RULES

pots = initial
  .split(//)
  .map
  .with_index { |p, i| p == '#' ? i : nil }
  .reject(&:nil?)

rules = rules_text.split(/\n/).inject({}) { |collection, rule|
  (left, right) = rule.split(' => ')
  collection.tap { |c| c[left.gsub('.', '0').gsub('#', '1').reverse.to_i(2)] = right }
}

def generate pots, rules, generations
  generations.times do
    marker = 0
    new_pots = []
    (pots.min - 2).upto(pots.max + 2) do |i|
      marker /= 2
      marker += 16 if pots.include?(i+2)
      new_pots << i if rules[marker] == '#'
    end
    pots = new_pots
  end
  pots.sum
end

t1 = Time.now
puts "Part one: #{generate(pots, rules, 20)}"
t2 = Time.now
puts "Part two: #{generate(pots, rules, 50000000000)}"
t3 = Time.now

puts "Part one time: #{t2 - t1} seconds"
puts "Part two time: #{t3 - t2} seconds"
