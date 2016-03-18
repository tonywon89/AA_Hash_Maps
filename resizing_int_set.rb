class ResizingIntSet

  def initialize(n = 3)
    @store = Array.new(n) { [] }
    @count = 0
  end

  def insert(num)
    return nil if include?(num)

    @count += 1

    if @count == @store.size
      resize
    end

    idx = num % @store.size
    @store[idx] << num
  end

  def resize
    new_array = Array.new(@count * 2) { [] }

    @store.each do |bucket|
      bucket.each do |num|
        idx = num % new_array.size
        new_array[idx] << num
      end
    end

    @store = new_array
  end

  def remove(num)
    idx = num % @store.size
    @store[idx].delete(num)
  end

  def include?(num)
    idx = num % @store.size
    @store[idx].include?(num)
  end

  def inspect
    @store.inspect
  end

end
