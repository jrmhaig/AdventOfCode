#!/usr/bin/env ruby
require 'digest'

10000000.times do |i|
  m = Digest::MD5.new
  m << "cxdnnyjw#{i}"
  if /^00000/ =~ m.hexdigest
    puts m.hexdigest
  end
end

