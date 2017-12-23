module AdventOfCode
  class DayTwentyThree
    attr_accessor :register, :pointer, :mul_count

    def initialize *rules
      @register = ('a'..'h').to_a.map{|i| [i, 0]}.to_h
      @pointer = 0
      @mul_count = 0
      @rules = rules.map do |rule|
        rule.split(/\s+/)
      end
    end

    def run
      while @pointer >= 0 && @pointer < @rules.count
        step
      end
    end

    def set key, value
      @register[key] = value_of value
      @pointer += 1
    end

    def sub key, value
      @register[key] -= value_of value
      @pointer += 1
    end

    def mul key, value
      @mul_count += 1
      @register[key] *= value_of value
      @pointer += 1
    end

    def jnz key, value
      @pointer += value_of(key) != 0 ? value_of(value) : 1
    end

    private

    def step
      send(*@rules[@pointer])
    end

    def value_of value
      /-?\d+/.match(value) ? value.to_i : @register[value]
    end
  end
end
