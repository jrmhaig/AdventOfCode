class Row
  attr_reader :data

  def initialize(data)
    @data = data.split(//)
  end

  def diff(other) = @data.zip(other.data).count { |pair| pair[0] != pair[1] }
end
