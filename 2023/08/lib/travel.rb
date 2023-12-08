class Travel
  def initialize(*directions, terminator:)
    @directions = directions
    @terminator = terminator
  end

  def steps(location)
    i = 0
    until @terminator.check(location)
      location = location.go(@directions[i % @directions.length])
      i += 1
    end
    i
  end
end