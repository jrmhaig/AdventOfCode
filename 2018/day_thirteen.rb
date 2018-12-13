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

input = File.read('day_thirteen_input.txt')

MAP = input.split /\n/
carts = []
replacements = {
  '>' => '-',
  '<' => '-',
  '^' => '|',
  'v' => '|'
}
DIRECTIONS = {
  '>' => Vector[ 1,  0],
  '<' => Vector[-1,  0],
  '^' => Vector[ 0, -1],
  'v' => Vector[ 0,  1]
}
TURNS = {
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

NEXT_TURN = {
  left: :straight,
  straight: :right,
  right: :left
}

MAP.each.with_index do |line, i|
  %w(> < v ^).each do |direction|
    j = -1
    until j.nil?
      j = line.index(direction, j+1)
      if !j.nil?
        carts << {pos: Vector[j, i], direction: direction, turn: :left}
        line[j] = replacements[direction]
      end
    end
  end
end

def drive carts, carry_on: false
  while carts.length > 1
    carts = carts.sort_by do |a|
      [ a[:pos][0], a[:pos][1] ]
    end

    carts.each do |cart|
      next if cart[:direction] == 'X'
      new_pos = cart[:pos] + DIRECTIONS[cart[:direction]]  
      if carts.map { |c| c[:pos] }.include? new_pos
        if carry_on
          carts.find { |c| c[:pos] == new_pos}[:direction] = 'X'
          cart[:direction] = 'X'
        else
          return new_pos
        end
      elsif MAP[new_pos[1]][new_pos[0]] == '+'
        cart[:direction] = TURNS[cart[:turn]][cart[:direction]]
        cart[:turn] = NEXT_TURN[cart[:turn]]
      else
        if cart[:direction] == '>'
          if MAP[new_pos[1]][new_pos[0]] == '\\'
            cart[:direction] = 'v'
          elsif MAP[new_pos[1]][new_pos[0]] == '/'
            cart[:direction] = '^'
          end
        elsif cart[:direction] == '<'
          if MAP[new_pos[1]][new_pos[0]] == '\\'
            cart[:direction] = '^'
          elsif MAP[new_pos[1]][new_pos[0]] == '/'
            cart[:direction] = 'v'
          end
        elsif cart[:direction] == '^'
          if MAP[new_pos[1]][new_pos[0]] == '\\'
            cart[:direction] = '<'
          elsif MAP[new_pos[1]][new_pos[0]] == '/'
            cart[:direction] = '>'
          end
        elsif cart[:direction] == 'v'
          if MAP[new_pos[1]][new_pos[0]] == '\\'
            cart[:direction] = '>'
          elsif MAP[new_pos[1]][new_pos[0]] == '/'
            cart[:direction] = '<'
          end
        end
      end
      cart[:pos] = new_pos
    end

    carts.reject! do |c|
      c[:direction] == 'X'
    end
  end
  return carts[0][:pos]
end

t1 = Time.now
boom = drive(carts)
puts "Part one: #{boom[0]},#{boom[1]}"
t2 = Time.now
boom = drive(carts, carry_on: true)
puts "Part two: #{boom[0]},#{boom[1]}"
t3 = Time.now

puts "Part one time: #{t2 - t1} seconds"
puts "Part two time: #{t3 - t2} seconds"
