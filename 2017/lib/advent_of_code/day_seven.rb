module AdventOfCode
  class DaySeven
    def initialize *data
      @data = {}
      @programs = []
      data.each do |line|
        if (match = /(\S+)\s+\((\d+)\)(.*)$/.match(line))
          @data[match[1]] = {
            weight: match[2].to_i,
            children: []
          }
          if submatch = /\s*-> (.+)$/.match(match[3])
            @data[match[1]][:children] = submatch[1].split(/,\s*/)
            @programs += submatch[1].split(/,\s*/)
          end
        end
      end
      @programs.uniq!
    end

    def base
      (@data.keys - @programs).first
    end

    def weight program
      @data[program][:weight] + @data[program][:children].map do |p|
        self.weight p
      end.sum
    end

    def find_error in_prog
      weights = {}
      @data[in_prog][:children].each do |c|
        weights[c] = weight(c)
      end
      min = weights.values.min
      max = weights.values.max

      if min == max
        return false
      else
        min_programs = weights.keys.select { |k| weights[k] == min }
        max_programs = weights.keys.select { |k| weights[k] == max }
        diff = nil
        program = if min_programs.length == 1
                    diff = max - min
                    min_programs[0]
                  else
                    diff = min - max
                    max_programs[0]
                  end
        find_error(program) || @data[program][:weight] + diff
      end
    end
  end
end
