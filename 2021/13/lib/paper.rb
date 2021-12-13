require 'forwardable'

class Paper
  extend Forwardable

  def_delegator :@points, :count

  def initialize(*points, commands:)
    @points = points
    @commands = commands.map { |command| [command::NAME, command] }.to_h
  end

  def execute(command, n)
    command = @commands[command].new(n)
    @points.map! { |point| command.call(point) }.uniq!
  end

  def display
    (@points.map(&:last).max+1).times do |y|
      (@points.map(&:first).max+1).times do |x|
        print (@points.include?([x, y]) ? '#' : '.')
      end
      puts
    end
  end
end
