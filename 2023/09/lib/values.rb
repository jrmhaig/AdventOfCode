class Values
  def initialize(*data)
    @data = data
  end

  def next
    return @data.last if @data.uniq.length == 1

    @data.last + next_values.next
  end

  def prev
    return @data.first if @data.uniq.length == 1

    @data.first - next_values.prev
  end

  private

  def next_values = @next_values ||= Values.new(*@data.each_cons(2).map { |a, b| b - a })
end
