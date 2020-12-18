#!/bin/env ruby

class FunnySum
  attr_accessor :part

  def initialize tape, part = :one
    @tape = tape
    @part = part
  end

  def total
    tmp_tape = evaluate_brackets @tape.dup
    tmp_tape = evaluate_plusses(tmp_tape) if part == :two
    total = tmp_tape.shift.to_i
    tmp_tape.each_slice(2).inject(total) do |t, pair|
      t.send(pair[0].to_sym, pair[1].to_i)
    end
  end

  def evaluate_brackets processed_tape
    while start = processed_tape.index('(')
      open = 1
      finish = start
      while open > 0
        finish += 1
        open += 1 if processed_tape[finish] == '('
        open -= 1 if processed_tape[finish] == ')'
      end
      before = start > 0 ? processed_tape[0..start-1] :  []
      after = finish < processed_tape.length ? processed_tape[finish+1..] : []
      processed_tape = before + [FunnySum.new(processed_tape[start+1..finish-1], @part).total] + after
    end
    processed_tape
  end

  def evaluate_plusses processed_tape
    while i = processed_tape.index('+')
      sum = processed_tape[i-1].to_i + processed_tape[i+1].to_i
      before = i > 1 ? processed_tape[0..i-2] : []
      after = i < processed_tape.length - 1 ? processed_tape[i+2..] : []
      processed_tape = before + [sum] + after
    end
    processed_tape
  end
end

sums = File.readlines('day_eighteen_input.txt').map do |line|
  FunnySum.new(line.chomp.gsub(/\s+/, '').split(//))
end
puts "1) #{sums.map do |s|
             s.part = :one
             s.total
           end.sum}"
puts "2) #{sums.map do |s|
             s.part = :two
             s.total
           end.sum}"
