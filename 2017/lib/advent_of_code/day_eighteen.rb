module AdventOfCode
  class DayEighteen
    attr_reader :counts
    attr_writer :method

    def initialize *steps
      @steps = steps
      @pointer = [0, 0]
      @values = [{'p' => 0}, {'p' => 1}]
      @played = [[], []]
      @method = :simple
      @deadlock = [false, false]
      @registers = [[], []]
      @counts = [0, 0]
    end

    def recover
      n = nil
      while n.nil?
        n = step
      end
      n
    end

    def run
      while !@deadlock[0] || !@deadlock[1]
        n = step 0
        n = step 1
      end
    end

    def played part = 0
      @played[part]
    end

    def values part = 0
      @values[part]
    end

    def pointer part = 0
      @pointer[part]
    end

    def step part = 0
      result = nil
      if match = /^snd (\w+)$/.match(@steps[@pointer[part]])
        if @method == :simple
          @played[part] << @values[part][match[1]]
        elsif @method == :complex
          @registers[1-part] << evaluate(part: part, input: match[1])
          @counts[part] += 1
        end
      elsif match = /^set (\w+) (.+)$/.match(@steps[@pointer[part]])
        @values[part][match[1]] = evaluate part: part, input: match[2]
      elsif match = /^add (\w+) (.+)$/.match(@steps[@pointer[part]])
        value_update(match[1], '+', match[2], part)
      elsif match = /^mul (\w+) (.+)$/.match(@steps[@pointer[part]])
        value_update(match[1], '*', match[2], part)
      elsif match = /^mod (\w+) (.+)$/.match(@steps[@pointer[part]])
        value_update(match[1], '%', match[2], part)
      elsif match = /^rcv (\w+)$/.match(@steps[@pointer[part]])
        if @method == :simple
          result = @played[part][-1] if @values[part][match[1]].positive?
        elsif @method == :complex
          if @registers[part].length > 0
            @values[part][match[1]] = @registers[part].shift
            @deadlock[part] = false
          else
            @deadlock[part] = true
            @pointer[part] -= 1
          end
        end
      elsif match = /^jgz (\w+) (-?.+)$/.match(@steps[@pointer[part]])
        @pointer[part] += evaluate(part: part, input: match[2]) - 1 if evaluate(part: part, input: match[1]).positive?
      else
        puts "Unknown matcher: #{@steps[@pointer[part]]}"
        exit
      end
      @pointer[part] += 1
      result
    end

    private

    def value_update a, opp, b, part = 0
      @values[part][a] = 0 if @values[part][a].nil?
      @values[part][a] = @values[part][a].send(opp, evaluate(part: part, input: b))
    end

    def evaluate input:, part: 0
      if /^-?\d+$/.match input
        input.to_i
      else
        @values[part][input].to_i
      end
    end
  end
end
