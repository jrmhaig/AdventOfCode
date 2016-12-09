#!/usr/bin/env ruby

input = File.read('input_day_9.txt')
#input = File.read('day_9_test.txt').split(/\n/)

def expand str, lvl = 1
  maxlvl = 1
  output = ''
  l = 0
  match1 = /^([^\(]*)(.*)$/
  match2 = /^\((\d+)x(\d+)\)(.*)$/
  while str.length > 0
    match1 =~ str
    l = l + $1.length
    str = $2
    break if str.length == 0

    match2 =~ str
    i = $1.to_i
    n = $2.to_i
    str = $3

    pattern = str[0, i]
    str.sub!(pattern, '')
    l = l + expand(pattern, lvl+1) * n
    puts "#{lvl}" + " "*lvl + ": #{str.length}" if lvl <= maxlvl
  end
  l
end

puts expand input
