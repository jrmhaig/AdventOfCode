#!/usr/bin/env ruby

input = File.read('input_day_8.txt').split(/\n/)
#input = File.read('day_8_test.txt').split(/\n/)

@width = 50
@height = 6
@grid = []
@height.times do |r|
  @grid << [false] * @width
end

def rect(x, y)
  x.times do |i|
    y.times do |j|
      @grid[j][i] = true
    end
  end
end

def colrot(col, n)
  m = n % @height
  newcol = []
  @height.times do |i|
    newcol[i] = @grid[(i - m) % @height][col]
  end
  @height.times do |i|
    @grid[i][col] = newcol[i]
  end
end

def rowrot(row, n)
  @grid[row].rotate!(-n)
end

def display
  @grid.each do |row|
    puts row.map{ |c| c ? 'O' : ' ' }.join ''
  end
end

input.each do |move|
  if /rect (\d+)x(\d+)/ =~ move
    rect($1.to_i, $2.to_i)
  elsif /rotate column x=(\d+) by (\d+)/ =~ move
    colrot($1.to_i, $2.to_i)
  elsif /rotate row y=(\d+) by (\d+)/ =~ move
    rowrot($1.to_i, $2.to_i)
  else
    puts "Could not understand '#{move}'"
  end
  puts move
  display
  puts "########"
end

puts @grid.inspect
puts @grid.flatten.select{|c| c}.count
