module AdventOfCode
  class DaySeventeen
    attr_reader :buffer
    attr_reader :pointers

    def initialize jump
      @jump = jump
      @buffer = [0]
      @pointers = [0]
      @count = 1
    end

    def run n
      n.times do
        step
      end
      @buffer[pointer(n) + 1]
    end

    def step
      @buffer.insert(pointer(@count), @count)
      @count += 1
    end

    def pointer n
      last = @pointers.length - 1
      if n > last
        ((last+1)..n).inject(@pointers[last]) do |i, j|
          @pointers << (j == 0 ? 0 : ((i + @jump) % j) + 1)
          @pointers[-1]
        end
      end
      @pointers[n]
    end
  end
end
