class Compare
  def initialize(groups)
    @groups = groups
  end

  def sum
    @groups.sum { |pair| pair[0] < pair[1] ? 1 : 0 }
  end
end
