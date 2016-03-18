class MaxIntSet

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    @store[num] =  true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

end
