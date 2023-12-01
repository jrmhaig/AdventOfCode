module NumberExtractor
  module WithWords
    NUMBER_MAPPING = {
      'one' => 'o1e',
      'two' => 't2o',
      'three' => 't3e',
      'four' => 'f4r',
      'five' => 'f5e',
      'six' => 's6x',
      'seven' => 's7n',
      'eight' => 'e8t',
      'nine' => 'n9e',
      'zero' => 'z0o'
    }

    def self.split(text)
      NUMBER_MAPPING.each_pair.each_with_object(text.dup) do |(word, number), t|
        t.gsub!(/#{word}/, number)
      end.gsub(/[a-z]/, '').split(//).map(&:to_i)
    end
  end
end
