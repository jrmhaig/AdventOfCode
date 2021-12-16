#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'bit_stream'

data = File.open('input.txt').read.chomp.split(//)
  .map { |b| b.hex.to_s(2).rjust(4, '0').split(//) }.flatten

bs = BitStream.new(*data)

puts "1) #{bs.version}"
puts "2) #{bs.value}"
