class BingoCaller
  attr_reader :latest

  def initialize
    @observers = []
    @latest = nil
  end

  def attach(observer)
    @observers << observer
  end

  def detatch(observer)
    @observers.delete(observer)
  end

  def players = @observers.length

  def call(n)
    @latest = n
    notify
  end

  private

  def notify
    @observers.each { |observer| observer.update(self) }
  end
end
