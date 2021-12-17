#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'probe'
require 'trench'

data = File.open('input.txt').read.chomp.gsub(/target area: x=/, '')
  .split(/, y=/).map { |part| part.split('..').map(&:to_i) }.flatten
trench = Trench.new(*data)

probes = []
trench.x_steps.each do |x|
  trench.y_steps.each do |y|
    probe = Probe.new(x, y, trench: trench)
    probes << probe if probe.on_target?
  end
end

best = probes.max { |a, b| a.y_max <=> b.y_max }

puts "1) #{best.y_max}"
puts "2) #{probes.count}"
