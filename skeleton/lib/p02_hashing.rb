class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    xor = 0
    self.each_with_index do |el, i|
      xor ^= (el.hash + i)
    end
    xor
  end
end

class String
  def hash
    self.bytes.map do |byte|
      byte + length.hash
    end.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    xor = 0

    self.each do |key, value|
      xor ^= key.to_s.hash + 1 # 1 designates key
      xor ^= value.to_s.hash + 2 # 2 designates value
    end

    xor
  end
end
