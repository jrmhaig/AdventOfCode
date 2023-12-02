class Subset
  attr_reader :red, :green, :blue

  def initialize(data)
    parts = data.split(/,\s*/)
    @red = parts.find { |part| part.match(/red/) }.to_i
    @green = parts.find { |part| part.match(/green/) }.to_i
    @blue = parts.find { |part| part.match(/blue/) }.to_i
  end
end
