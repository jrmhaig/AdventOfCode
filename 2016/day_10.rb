#!/usr/bin/env ruby

input = File.read('input_day_10.txt').split(/\n/)
#input = File.read('day_10_test.txt').split(/\n/)

@bots = {}
@instructions = {}
@outputs = {}

def give_to_bot bot, n
  if @bots.has_key? bot
    @bots[bot] << n
  else
    @bots[bot] = [ n ]
  end
end

def set_instruction bot, low_target, low, high_target, high
  @instructions[bot] = {
    low: { target: low_target, n: low },
    high: { target: high_target, n: high }
  }
end

def process bot
  bits = Hash[[:low, :high].zip(@bots[bot].sort{ |a, b| a.to_i <=> b.to_i })]

  #puts "Bot: #{bot}"
  #puts "DATA: #{@bots[bot].inspect}"

  [:low, :high].each do |x|
    #puts "  #{bits[x]} to #{@instructions[bot][x][:target]} #{@instructions[bot][x][:n]}"
    if @instructions[bot][x][:target] == 'bot'
      give_to_bot @instructions[bot][x][:n], bits[x]
      #puts "    bot #{@instructions[bot][x][:n]}: #{@bots[@instructions[bot][x][:n]].inspect}"
    elsif @instructions[bot][x][:target] == 'output'
      @outputs[@instructions[bot][x][:n]] = bits[x]
      #puts "    output #{@instructions[bot][x][:n]}: #{@outputs[@instructions[bot][x][:n]]}"
    else
      puts "Didn't understand target #{@instructions[bot][x][:target]}"
    end
  end

  @bots[bot] = []
end

def show_outputs
  @outputs.keys.sort{ |a, b| a.to_i <=> b.to_i }.each do |k|
    puts "#{k}: #{@outputs[k]}"
  end
end

input.each do |line|
  if /value (\d+) goes to bot (\d+)/ =~ line
    give_to_bot $2, $1
  elsif /bot (\d+) gives low to (bot|output) (\d+) and high to (bot|output) (\d+)/ =~ line
    set_instruction $1, $2, $3, $4, $5
  else
    puts "Cannot understand #{line}"
  end
end

while @bots.keys.select{ |b| @bots[b].length >= 2}.length > 0
  @bots.keys.select{ |b| @bots[b].length >= 2 }.each do |b|
    process(b)
  end
  #show_outputs
  #puts "####"
end

#puts
#puts 'Bots'
#puts @bots
#puts 'Instructions'
#puts @instructions
#puts 'Outputs'
show_outputs

puts @outputs['0'].to_i * @outputs['1'].to_i * @outputs['2'].to_i
