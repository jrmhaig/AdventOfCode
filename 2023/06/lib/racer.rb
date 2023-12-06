class Racer
  def initialize(time, distance)
    @time = time
    @distance = distance
  end

  def winners
    sqrt = Math.sqrt(@time**2 - 4*@distance)
    # Add/subtract 0.0001 to avoid exact matches
    low = ((@time-sqrt)/2 + 0.0001).ceil
    high = ((@time+sqrt)/2 - 0.0001).floor

    low.upto(high).to_a
  end
end
