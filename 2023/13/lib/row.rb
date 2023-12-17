class Row
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def mirrors
    (@data.length-1).times.each_with_object([]) do |i, mirrors|
      j = @data.length - i - 2
      left = truncate(@data[..i].reverse, [i, j].min + 1)
      right = truncate(@data[i+1..], [i, j].min + 1)
      mirrors << i if left == right
    end
  end

  def ==(other)
    @data == other.data
  end

  private

  def truncate(str, n)
    str[0, n]
  end
end
