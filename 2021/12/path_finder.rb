#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'cave_network'
require 'travellers/one'
require 'travellers/two'

data = File.open('input.txt').readlines.map { |line| line.chomp.split(/-/) }

network1 = CaveNetwork.new(traveller: Travellers::One.new)
network2 = CaveNetwork.new(traveller: Travellers::Two.new)

data.each do |passage|
  network1.add_passage(*passage)
  network2.add_passage(*passage)
end

puts "1) #{network1.search(network1.cave('start'))}"
puts "2) #{network2.search(network2.cave('start'))}"
