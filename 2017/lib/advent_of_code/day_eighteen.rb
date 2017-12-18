module AdventOfCode
  class DayEighteen
    attr_reader :pointer, :values, :played

    def initialize *steps
      @steps = steps
      @pointer = 0
      @values = {}
      @played = []
    end

    def recover
      n = nil
      while n.nil?
        n = step
      end
      n
    end

    def step
      result = nil
      if match = /^snd (\w+)$/.match(@steps[@pointer])
        @played << @values[match[1]]
      elsif match = /^set (\w+) (.+)$/.match(@steps[@pointer])
        @values[match[1]] = evaluate match[2]
      elsif match = /^add (\w+) (.+)$/.match(@steps[@pointer])
        value_update(match[1], '+', match[2])
      elsif match = /^mul (\w+) (.+)$/.match(@steps[@pointer])
        value_update(match[1], '*', match[2])
      elsif match = /^mod (\w+) (.+)$/.match(@steps[@pointer])
        value_update(match[1], '%', match[2])
      elsif match = /^rcv (\w+)$/.match(@steps[@pointer])
        result = @played[-1] if @values[match[1]].positive?
      elsif match = /^jgz (\w+) (-?.+)$/.match(@steps[@pointer])
        @pointer += evaluate(match[2]) - 1 if @values[match[1]].positive?
      else
        puts "Unknown matcher: #{@steps[@pointer]}"
        exit
      end
      @pointer += 1
      result
    end

    private

    def value_update a, opp, b
      @values[a] = 0 if @values[a].nil?
      @values[a] = @values[a].send(opp, evaluate(b))
    end

    def evaluate input
      if /^-?\d+$/.match input
        input.to_i
      else
        @values[input].to_i
      end
    end
  end
end
