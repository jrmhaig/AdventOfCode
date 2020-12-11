#!/bin/env ruby

class PseudoFibonacci
  # Is it still a Fibonacci sequence if it sums the previous 3 instead of 2?
  def initialize
    @list = [0, 1, 1]
  end

  def [] n
    @list.length.upto(n) { |i| @list[i] = @list[i-3..i-1].sum }

pp @list
    @list[n]
  end
end

class Chain
  attr_reader :diffs, :groups

  def initialize
    @last = 0
    @diffs = {1 => 0, 2 => 0, 3 => 0}
    @groups = [1]
  end

  def add n
    if n - @last == 1
      @groups[-1] += 1
      @diffs[1] += 1
    else
      @groups << 1
      @diffs[3] += 1
    end

    @last = n
  end
end


jolts = File.readlines('day_ten_input.txt').map(&:to_i).sort

chain = jolts.each_with_object(Chain.new) { |i, chn| chn.add(i) }

puts "1) #{chain.diffs[1] * (chain.diffs[3] + 1)}"
fib = PseudoFibonacci.new
puts "2) #{chain.groups.inject(1) { |prod, i| prod * fib[i] } }"
