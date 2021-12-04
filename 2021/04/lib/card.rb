class Card
  def initialize(*rows)
    @rows = rows.map { |row| row.gsub(/^\s*/, '').split(/\s+/).map(&:to_i) }
    @n_cols = @rows.first.length
  end

  def update(bingo_caller)
    @rows.each do |row|
      i = row.index(bingo_caller.latest)
      row[i] = nil if i
    end
  end

  def score = @rows.sum { |row| row.map(&:to_i).sum }

  def won? = full_row || full_col

  private

  def full_row = @rows.map { |row| row.reject(&:nil?).empty? }.any?

  def full_col = cols.map { |col| col.reject(&:nil?).empty? }.any?

  def cols = @n_cols.times.map { |i| @rows.map { |row| row[i] } }
end
