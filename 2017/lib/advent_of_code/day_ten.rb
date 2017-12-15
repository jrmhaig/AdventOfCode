module AdventOfCode
  class DayTen
    attr_reader :code

    def initialize size:, inputs:, type: :full, rounds: 1
      @code = (0..size-1).to_a
      @pointer = 0
      @skip = 0

      data = case type
             when :simple
               inputs.split(/,/).map(&:to_i)
             when :full
               inputs.split(//).map(&:ord) + [17, 31, 73, 47, 23]
             end

      rounds.times do
        data.each do |n|
          twist(n)
        end
      end
    end

    def twist n
      if @pointer + n <= @code.length
        before = @code[0, @pointer]
        selected = @code[@pointer, n]
        after = @code[@pointer + n, @code.length - n]
        @code = before + selected.reverse + after
      else
        mark = (@pointer + n) % @code.length
        selected_tail = @code[0, mark]
        middle = @code[mark, @code.length - n]
        selected_head = @code[@pointer, @code.length - @pointer]
        selected = (selected_head + selected_tail).reverse
        @code = selected[n - mark, mark] + middle + selected[0, n - mark]
      end
      @pointer = (@pointer + n + @skip) % @code.length
      @skip += 1
    end

    def dense
      ("%02x"*16) % 0.step(255,16).to_a.map do |i|
        @code[i, 16].inject(0) { |x, j| x ^= j }
      end
    end

    def checksum
      @code[0] * @code[1]
    end
  end
end
