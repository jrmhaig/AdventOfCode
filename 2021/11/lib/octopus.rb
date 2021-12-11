class Octopus
  attr_reader :energy, :flash_count

  def initialize(energy)
    @energy = energy
    @observers = []
    @flashed = false
    @flash_count = 0
  end

  def attach(observer)
    @observers << observer
  end

  def energize
    @energy += 1
  end

  def flash
    return 0 if @flashed || @energy <= 9

    @observers.each(&:energize)
    @flashed = true
    @flash_count += 1
    1
  end

  def unflash
    return unless @flashed

    @flashed = false
    @energy = 0
  end
end
