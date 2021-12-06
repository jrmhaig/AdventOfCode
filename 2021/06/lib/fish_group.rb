class FishGroup
  attr_accessor :juveniles
  attr_writer :adults, :child_group

  def initialize(day)
    @day = day
    @adults = 0
    @juveniles = 0
  end

  def grow
    return spawn if @day == 0

    @day -= 1
  end

  def spawn
    @child_group.juveniles += @adults
    @adults += @juveniles
    @juveniles = 0
    @day = 6
  end

  def count = @adults + @juveniles
end
