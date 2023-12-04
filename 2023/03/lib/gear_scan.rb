require 'part'

class GearScan
  def initialize(*data)
    @data = data
  end

  def call
    find_parts
      .select { |set| set.length == 2 }
      .map { |pair| pair[0]*pair[1] }
      .sum
  end

  private

  def find_parts
    count = 0
    @data.each_with_index.each_with_object([]) do |(row, i), groups|
      # puts row
      j = row.index('*')
      while j do
        group = []
        before = row[0..j-1].match(/(\d+)$/)
        group << before[1].to_i if before
        after = row[j+1..].match(/^(\d+)/)
        group << after[1].to_i if after

        if i > 0
          group += find_numbers(@data[i-1], j)
        end
        if i < @data.length - 1
          group += find_numbers(@data[i+1], j)
        end

        groups << group.compact
        j = row.index('*', j+1)
        count += 1
      end
    end
  end

  def find_numbers(row, x)
    match = row[0..x-1].match(/(\d+)$/)
    before = match ? match[1] : nil
    match = row[x+1..].match(/^(\d+)/)
    after = match ? match[1] : nil

    if row[x].match(/\d/)
      ["#{before}#{row[x]}#{after}".to_i]
    else
      [before && before.to_i, after && after.to_i]
    end
  end
end
