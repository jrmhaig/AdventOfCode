#!/usr/bin/env ruby

require 'matrix'

input = <<~MAP
/->-\\        
|   |  /----\\
| /-+--+-\\  |
| | |  | v  |
\\-+-/  \\-+--\/
  \\------/   
MAP

map = input.split /\n/
carts = []
replacements = {
  '>' => '-',
  '<' => '-',
  '^' => '|',
  'v' => '|'
}
directions = {
  '>' => Vector[ 1,  0],
  '<' => Vector[-1,  0],
  '^' => Vector[ 0, -1],
  'v' => Vector[ 0,  1]
}
turns = {
  left: {
    '>' => '^',
    '<' => 'v',
    '^' => '<',
    'v' => '>'
  },
  straight: {
    '>' => '>',
    '<' => '<',
    '^' => '^',
    'v' => 'v'
  },
  right: {
    '>' => 'v',
    '<' => '^',
    '^' => '>',
    'v' => '<'
  }
}

next_turn = {
  left: :straight,
  straight: :right,
  right: :left
}

map.each.with_index do |line, i|
  puts "#{i} #{line}"
  %w(> < v ^).each do |direction|
    j = -1
    until j.nil?
      j = line.index(direction, j+1)
      if !j.nil?
        carts << {pos: Vector[j, i], direction: direction, turn: :left}
        line[j] = replacements[direction]
        puts "> #{line}"
      end
    end
  end
end

10.times do
  # To do: sort the carts
  carts.each do |cart|
    cart[:pos] += directions[cart[:direction]]  
    if map[cart[:pos][0], cart[:pos][1]] == '+'
      cart[:direction] = turns[cart[:turn][cart[:direction]]]
      cart[:turn] = next_turn[cart[:turn]]
    else
      if cart[:direction] == '>'
require 'pry'
binding.pry
        if map[cart[:pos][0], cart[:pos][1]] == '\\'
          cart[:direction] == 'v'
        elsif map[cart[:pos][0], cart[:pos][1]] == '/'
          cart[:direction] == '^'
        end
      elsif cart[:direction] == '<'
        if map[cart[:pos][0], cart[:pos][1]] == '\\'
          cart[:direction] == '^'
        elsif map[cart[:pos][0], cart[:pos][1]] == '/'
          cart[:direction] == 'v'
        end
      elsif cart[:direction] == '^'
        if map[cart[:pos][0], cart[:pos][1]] == '\\'
          cart[:direction] == '<'
        elsif map[cart[:pos][0], cart[:pos][1]] == '/'
          cart[:direction] == '>'
        end
      elsif cart[:direction] == 'v'
        if map[cart[:pos][0], cart[:pos][1]] == '\\'
          cart[:direction] == '>'
        elsif map[cart[:pos][0], cart[:pos][1]] == '/'
          cart[:direction] == '<'
        end
      end
    end
  end
  pp carts
end
