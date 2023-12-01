class Line
  def initialize(text, extractor:)
    @numbers = extractor.split(text)
  end

  def calibration_value = "#{@numbers.first}#{@numbers.last}".to_i
end
