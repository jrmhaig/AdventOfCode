module AdventOfCode
  class DayEight
    attr_reader :maximum

    def initialize data
      @registers = {}
      @maximum = 0
      data.each { |line| process(line) }
    end

    def largest
      @registers.values.max
    end

    private

    def process line
      parts = line.split(/\s+/)
      @registers[parts[0]] ||= 0
      @registers[parts[4]] ||= 0
      if @registers[parts[4]].send(parts[5], parts[6].to_i)
        @registers[parts[0]] += ( parts[1] == 'inc' ? 1 : -1 ) * parts[2].to_i
        @maximum = [@registers[parts[0]], @maximum].max
      end
    end
  end
end
