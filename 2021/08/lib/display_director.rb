require 'display'

class DisplayDirector
  def initialize(builder)
    @builder = builder
  end

  def create
    Display.new(
      @builder.zero, @builder.one, @builder.two, @builder.three,
      @builder.four, @builder.five, @builder.six, @builder.seven,
      @builder.eight, @builder.nine
    )
  end
end
