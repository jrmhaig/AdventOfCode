$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_twelve'

data = File.read('day_twelve_input.txt').chomp.split(/\n/)

comms = AdventOfCode::DayTwelve.new *data

puts "Part one: #{comms.group(0).count}"
