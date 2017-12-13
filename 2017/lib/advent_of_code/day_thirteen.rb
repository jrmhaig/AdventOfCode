module AdventOfCode
  class DayThirteen
    attr_reader :state

    def initialize depths
      @depths = depths
      @state = @depths.keys.map { |n| [n, 0] }.to_h
      @directions = @depths.keys.map { |n| [n, 1] }.to_h
    end

    def step
      @depths.keys.each do |i|
        @state[i] += @directions[i]
        @directions[i] *= -1 if @state[i] == 0 or @state[i] == @depths[i] - 1
      end
    end

    def severity n
      severity = 0
      (@depths.keys.max + 1).times do |i|
        severity += i * @depths[i] if @state[i] == n
        step
      end
      severity
    end
  end
end
