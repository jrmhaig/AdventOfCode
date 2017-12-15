module AdventOfCode
  class DayFifteen
    DIVIDER = 2147483647
    FACTORS = {
      a: 16807,
      b: 48271
    }

    def initialize a, b
      @a = a
      @b = b
    end

    def generate_next generator, input
      input * FACTORS[generator] % DIVIDER
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
          print "\r#{i} : #{c}"
        end
      end
      c
    end
  end
end
