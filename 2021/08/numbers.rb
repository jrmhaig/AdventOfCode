#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'decoder'
require 'display_director'
require 'display_builders/one'
require 'display_builders/two'
require 'evaluators/count_valid'
require 'evaluators/concat'

data = File.open('input.txt').readlines.map(&:chomp)

evaluator = Evaluators::CountValid.new
part_1 = data.sum do |line|
  (pattern, code) = line.split(' | ').map { |l| l.split(/\s+/) }
  display = DisplayDirector.new(DisplayBuilders::One.new(*pattern)).create

  Decoder.new(code: code, display: display, evaluator: evaluator).evaluate
end

puts "1; #{part_1}"

evaluator = Evaluators::Concat.new
part_2 = data.sum do |line|
  (pattern, code) = line.split(' | ').map { |l| l.split(/\s+/) }
  display = DisplayDirector.new(DisplayBuilders::Two.new(*pattern)).create

  Decoder.new(code: code, display: display, evaluator: evaluator).evaluate
end

puts "2; #{part_2}"
