class Part
  attr_reader :symbols, :number

  def initialize(row, above:, below:)
    @number = row.gsub(/[^\d]*/, '').to_i
    @symbols = "#{above}#{row}#{below}".gsub(/[\.\d]*/, '').split(//)
  end
end
