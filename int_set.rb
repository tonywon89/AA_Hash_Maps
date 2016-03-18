class IntSet

  def initialize
    @store = Array.new(20) { [] }
  end

  def include?(num)
    idx = num % 20
    @store[idx].include?(num)
  end

  def insert(num)
    unless self.include?(num)
      idx = num % 20
      @store[idx] << num
    end
  end

  def delete(num)
    idx = num % 20
    @store[idx].delete(num)
  end

end
