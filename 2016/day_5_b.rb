#!/usr/bin/env ruby
require 'digest'

answer1 = ['.','.','.','.','.','.','.','.']
answer2 = ['.','.','.','.','.','.','.','.']
100000000.times do |i|
  m = Digest::MD5.new
  m << "cxdnnyjw#{i}"
  #m << "abc#{i}"
  if /^00000(\d)(.)/ =~ m.hexdigest
    puts m.hexdigest
    j = $1.to_i
    ans = $2
    puts "#{i} #{j} #{ans}"
    if j <= 7
      answer1[j] = ans
      answer2[j] = ans if answer2[j] == '.'
    end
    puts "1 >>> #{answer1.join('')}"
    puts "2 >>> #{answer2.join('')}"
  end
  break if ! answer1.include? '.'
end

puts "1 >>> #{answer1.join('')}"
puts "2 >>> #{answer2.join('')}"

