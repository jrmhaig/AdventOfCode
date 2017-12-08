module AdventOfCode
  class DayEight
    def initialize data
      @data = data
      @registers = {}
    end

    def find_largest
      @data.each { |line| process(line) }
      @registers.values.max
    end

    private

    def process line
      parts = line.split(/\s+/)
      @registers[parts[0]] ||= 0
      @registers[parts[4]] ||= 0
      if @registers[parts[4]].send(parts[5], parts[6].to_i)
        @registers[parts[0]] += ( parts[1] == 'inc' ? 1 : -1 ) * parts[2].to_i
      end
    end
  end
end
