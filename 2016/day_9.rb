#!/usr/bin/env ruby

input = File.read('input_day_9.txt')
#input = File.read('day_9_test.txt').split(/\n/)

def expand str
  output = ''
  match1 = /^([^\(]*)(.*)$/
  match2 = /^\((\d+)x(\d+)\)(.*)$/
  while str.length > 0
    match1 =~ str
    output = output + $1
    str = $2
    break if str.length == 0

    match2 =~ str
    puts ">> #{$1}, #{$2}"
    str = $3

    pattern = str[0, $1.to_i]
    output = output + pattern * $2.to_i
    str.sub!(pattern, '')
    #puts "  #{input.length}"
  end
  output
end

input = expand input

puts input.length

