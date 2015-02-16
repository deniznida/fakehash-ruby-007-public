class FakeHashWrapper

  # write code here
  def initialize
    @hash = {}
  end

  def []=(key, value)
    @hash[key.to_sym] = value
  end

  def [](key)
    @hash[key.to_sym]
  end

  def keys
    @hash.collect { |key,value| key }.sort { |a,b| b <=> a }
  end

  def values
    @hash.collect { |key,value| value }.sort { |a,b| b <=> a }
  end

  def first_letter(letter)
    @hash.collect do |key, value|
      if key.to_s.chars.first == letter
        value
      end
    end.compact
  end
  
  def each
    i = 0
    keys = @hash.keys
    values = @hash.values
    while i < @hash.size
      yield(keys[i], values[i])
      i += 1
    end
  end

end