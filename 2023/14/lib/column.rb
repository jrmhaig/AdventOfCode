class Column
  def initialize(*data)
    @boulders = data.select { |x| x == 'O' }
    @height = data.count

    rocks = [-1, *data.each_with_index.filter_map { |a, i| i if a == '#' }, data.length]
    @boulders = rocks.each_cons(2).map do |i, j|
      {
        start: i + 1,
        count: data[i+1, j-i].select { |x| x == 'O' }.count
      }
    end
  end

  def weight
    @boulders.sum do |data|
      triangle(@height - data[:start]) - triangle(@height - data[:start] - data[:count])
    end
  end

  private

  def triangle(n) = n * (n + 1) / 2
end
