module AdventOfCode
  module DaySix
    def self.loop_count input
      self.locate_loop(input)[1].length
    end

    def self.loop_size input
      data = self.locate_loop(input)
      data[1].length - data[1].find_index(data[0])
    end

    def self.locate_loop input
      seen = []
      current = input
      while ! seen.include? current
        seen << Array.new(current)
        current = self.redistribute current
      end
      [current, seen]
    end

    def self.redistribute input
      n = input.max
      i = input.find_index(n)
      per_block = n / input.length
      extras = n % input.length
      input[i] = 0
      input.map.with_index do |m, j|
        m + per_block + ((j - i - 1) % input.length < extras ? 1 : 0)
      end
    end
  end
end
