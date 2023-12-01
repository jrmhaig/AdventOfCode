class Line
  def initialize(text)
    @numbers = text.gsub(/[a-z]/, '').split(//)
  end

  def calibration_value = "#{@numbers.first}#{@numbers.last}".to_i
end
