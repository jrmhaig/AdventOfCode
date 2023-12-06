$LOAD_PATH << File.expand_path('lib', __dir__)

require 'racer'

input = File.read('input.txt').split(/\n/)
times = input[0].split(/\s+/)[1..].map(&:to_i)
distances = input[1].split(/\s+/)[1..].map(&:to_i)

racers = times.zip(distances).map { |pair| Racer.new(*pair) }
puts "Part 1: #{racers.map { |racer| racer.winners.count }.reduce(&:*) }"

time = input[0].split(/\s+/)[1..].reduce(&:+).to_i
distance = input[1].split(/\s+/)[1..].reduce(&:+).to_i

racer = Racer.new(time, distance)
puts "Part 2: #{racer.winners.count}"
