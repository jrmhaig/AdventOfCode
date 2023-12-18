class Step
  attr_writer :hash_method

  def initialize(data, hash_method: :all)
    @data = data
    @hash_method = hash_method
  end

  def hash
    hash_data.inject(0) do |n, char|
      ((n + char.ord) * 17) % 256
    end
  end

  def code = matcher[1]
  def symbol = matcher[2]
  def focal_length = matcher[3].to_i

  private

  def hash_data
    return @data.gsub(/[=-].*$/, '').split(//) if @hash_method == :code

    @data.split(//)
  end

  def matcher
    @length_match ||= @data.match(/^(.+)([=-])(\d*)$/)
  end
end
