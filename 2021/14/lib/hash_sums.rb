module HashSums
  private

  def add_hashes(first, second)
    (first.keys + second.keys).map do |key|
      [key, first[key].to_i + second[key].to_i]
    end.to_h
  end
end
