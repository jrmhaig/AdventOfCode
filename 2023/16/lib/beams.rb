class Beams
  attr_reader :heads

  def initialize(*heads, contraption:)
    @heads = heads
    @illuminated = @heads
    @contraption = contraption
  end

  def step
    @heads = @heads.map { |head| @contraption.travel(head) }.flatten.reject { |head| @illuminated.include?(head) }
    @illuminated += @heads
    @illuminated.uniq!
  end

  def illuminate
    until @heads.empty?
      step
    end
    @illuminated.map(&:position).uniq.count
  end
end
