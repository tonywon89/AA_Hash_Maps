class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  attr_reader :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    return nil if i >= @count
    @store[i]

  end

  def []=(i, val)
    @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
  end

  def push(val)
    @count += 1
    new_static = StaticArray.new(@count)
    new_static[@count - 1] = val

    @store[@count] = val

    i = @count - 1
    while i > 0
      new_static[i - 1] = @store[i]
      i -= 1
    end

    @store = new_static
  end

  def unshift(val)
    @count += 1
    new_static = StaticArray.new(@count)
    new_static[0] = val

    i = 1
    while i < @count
      new_static[i] = @store[i - 1]
      i += 1
    end

    @store = new_static
  end

  def pop
    @store[@count - 1] = nil
  end

  def shift
  end

  def first
  end

  def last
  end

  def each
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
  end
end
