module NumberExtractor
  module JustNumbers
    def self.split(text) = text.gsub(/[a-z]/, '').split(//).map(&:to_i)
  end
end
