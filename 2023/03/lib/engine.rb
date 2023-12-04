class Engine
  def initialize(*data, scanner:)
    @scanned_data = scanner.new(*data).call
  end

  def sum = @scanned_data[:parts].sum(&:number)
end
