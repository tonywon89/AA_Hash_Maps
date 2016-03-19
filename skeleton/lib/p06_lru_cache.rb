require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      val = @map.get(key)
      update_link!(key, val)
      return val
    else
      eject! if count == @max
      calc!(key)
      @store.last.val
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    @map.set(key, val)
    @store.insert(key, val) #inserts to tail, tail is newest
  end

  def update_link!(key, val)
    # suggested helper method; move a link to the end of the list
    @store.remove(key)
    @store.insert(key, val)
  end

  def eject!
    key = @store.first.key
    @map.delete(key)
    @store.remove(key)
  end
end
