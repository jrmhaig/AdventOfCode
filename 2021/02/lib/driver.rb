class Driver
  def initialize(sub, *commands)
    @sub = sub
    @commands = commands.map do |command|
      [command::NAME, command]
    end.to_h
  end

  def execute(command, distance)
    @commands[command].new(@sub, distance).call
  end
end
