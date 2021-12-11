class Conductor
  attr_reader :cycles

  def initialize
    @observers = []
    @cycles = 0
  end

  def attach(observer)
    @observers << observer
  end

  def cycle
    @cycles += 1
    energize_octopuses
    flash_count = flash_octopuses
    unflash_octopuses

    flash_count
  end

  private

  def energize_octopuses
    @observers.each(&:energize)
  end

  def flash_octopuses
    flash_count = 0
    loop do
      new_flashes = @observers.sum(&:flash)
      return flash_count if new_flashes == 0
      flash_count += new_flashes
    end
  end

  def unflash_octopuses
    @observers.each(&:unflash)
  end
end
