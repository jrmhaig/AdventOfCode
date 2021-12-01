class SimpleGroup
  include Enumerable

  def initialize(data)
    @data = data
  end

  def each
    (@data.length-1).times do |i|
      yield pair(i)
    end
  end

  private

  def pair(i) = [@data[i], @data[i+1]]
end
