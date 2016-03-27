require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return nil if include?(key)
    @count += 1
    resize! if @count == num_buckets
    self[key] << key
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    @count -= 1 if self[key].delete(key)
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `num`
    idx = key.hash % num_buckets
    @store[idx]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@count * 2) { [] }

    @store.flatten.each do |key|
      idx = key.hash % new_store.length
      new_store[idx] << key
    end

    @store = new_store
  end
end
