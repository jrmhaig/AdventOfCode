require 'row'

class Cluster
  attr_writer :smudges

  def initialize(*rows)
    @rows = rows.map { |row| Row.new(row) }
    @cols = rows.first.length.times.map { |i| Row.new(rows.map { |row| row[i] }.join) }
    @smudges = 0
  end

  def v_mirror = mirror(@cols)
  def h_mirror = mirror(@rows)

  private

  def mirror(set)
    set[..-2].each_with_index do |row, i|
      return i + 1 if [i+1, set.count - i - 1].min.times.sum { |j| set[i-j].diff(set[i+1+j]) } == @smudges
    end
    0
  end
end
