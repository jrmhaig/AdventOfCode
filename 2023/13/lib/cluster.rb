require 'row'

class Cluster
  MAX_COLS = 20

  def initialize(*rows)
    @rows = rows.map { |row| Row.new(row) }
  end

  def v_mirror
    1 + (
      @rows.map(&:mirrors)
        .inject((0..MAX_COLS).to_a) { |all, row| all & row }
        .first || -1
    )
  end

  def h_mirror
    @rows[..-2].each_with_index do |row, i|
      return i + 1 if [i+1, @rows.count - i - 1].min.times.all? { |j| @rows[i-j] == @rows[i+1+j] }
    end
    0
  end
end
