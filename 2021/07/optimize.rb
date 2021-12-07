#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'calculate'
require 'calculation/linear'
require 'calculation/incremental'

data = File.open('input.txt').read.chomp.split(',').map(&:to_i)

calculate = Calculate.new(data: data, calculation: Calculation::Linear.new)
puts "1; #{calculate.fuel_range.min}"
calculate = Calculate.new(data: data, calculation: Calculation::Incremental.new)
puts "2; #{calculate.fuel_range.min}"
