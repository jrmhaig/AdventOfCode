class MultiGroup
  include Enumerable

  def initialize(data)
    @data = data
  end

  def each
    (@data.length-3).times do |i|
      yield pair(i)
    end
  end

  private

  def pair(i) = [@data[i, 3].sum, @data[i+1, 3].sum]
end
