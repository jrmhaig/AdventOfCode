#!/usr/bin/env ruby

# Test data
#initial = '#..#.#..##......###...###'
#rules_text = <<~RULES
#...## => #
#..#.. => #
#.#... => #
#.#.#. => #
#.#.## => #
#.##.. => #
#.#### => #
##.#.# => #
##.### => #
###.#. => #
###.## => #
####.. => #
####.# => #
#####. => #
#RULES

# Day twelve input
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

rules = rules_text
  .split(/\n/)
  .map { |rule| rule.split(' => ') }
  .select { |pair| pair[1] == '#' }
  .map { |pair| pair[0] }

def generate pots, rules, generations
  left = 0
  new_pots = []
  last_pots = ''
  last_left = 0
  generations.times do |j|
    print "\r#{j}" if j % 1000000 == 0
    pots = '....' + pots + '....'
    new_pots = []
    left -= 4
    rules.each do |rule|
      i = -1
      until i.nil?
        i = pots.index(rule, i+1)
        new_pots << (i + left + 2) if i
      end
    end
    new_pots.sort!
    left = new_pots[0]
    pots = new_pots.min.upto(new_pots.max).map do |i|
      new_pots.include?(i) ? '#' : '.'
    end.join
    if pots == last_pots
      remaining = generations - j - 1
      return new_pots.map { |p| p + remaining }.sum
    end
    last_pots = pots
    last_left = left
  end
  new_pots.sum
end

t1 = Time.now
puts "Part one: #{generate(initial, rules, 20)}"
t2 = Time.now
puts "Part two: #{generate(initial, rules, 50000000000)}"
t3 = Time.now

puts "Part one time: #{t2 - t1} seconds"
puts "Part two time: #{t3 - t2} seconds"
