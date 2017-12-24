module AdventOfCode
  class DayFifteen
    DIVIDER = 2147483647
    FACTORS = {
      a: 16807,
      b: 48271
    }
    MULTIPLIERS = {
      a: 4,
      b: 8
    }

    def initialize method, a, b
      @method = method
      @a = a
      @b = b
    end

    def generate_next generator, input
      loop do
        input = input * FACTORS[generator] % DIVIDER
        return input if (@method == :simple or (input % MULTIPLIERS[generator] == 0))
      end
    end

    def compare a, b
      a.to_s(2).rjust(32, '0')[-16,32] == b.to_s(2).rjust(32, '0')[-16,32]
    end

    def count n
      c = 0
      n.times do |i|
        @a = generate_next :a, @a
        @b = generate_next :b, @b
        if compare @a, @b
          c += 1
          #print "\r#{i} : #{c}"
        end
      end
      c
    end
  end
end
