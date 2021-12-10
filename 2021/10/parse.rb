#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'chunk_factory'
require 'wrapper'

raw_lines = File.open('input.txt').readlines.map(&:chomp)

factory = ChunkFactory.new
lines = raw_lines.map do |line|
  remainder = line
  wrapper = Wrapper.new do |w|
    while remainder && remainder.length > 0
      chunk, remainder = factory.chunk(remainder)
      w.append(chunk)
    end
  end
end

scores = lines.map(&:corrupt_score).tally
puts "1) #{scores.each_pair.sum { |score, count| score.to_i * count }}"

lines.reject!(&:corrupt_score)
n = (lines.length - 1)/2
puts "2) #{lines.map(&:complete_score).sort[n]}"
