class Validator
  def initialize(**kwargs)
    @red = kwargs[:red]
    @green = kwargs[:green]
    @blue = kwargs[:blue]
  end

  def check(*subsets)
    subsets.each do |subset|
      return false if subset.red > @red || subset.green > @green || subset.blue > @blue
    end
    true
  end
end
