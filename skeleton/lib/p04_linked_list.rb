class Link
  attr_accessor :key, :val, :prev, :next

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @prev = nil
    @next = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList

  include Enumerable
  
  def initialize
    @head = Link.new
    @tail = Link.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next unless empty?
  end

  def last
    @tail.prev unless empty?
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    link = @tail.prev

    until link == @head
      return link.val if link.key == key
      link = link.prev
    end

    nil
  end

  def include?(key)
    link = @tail.prev

    until link == @head
      return true if link.key == key
      link = link.prev
    end

    false
  end

  def insert(key, val)
    link = Link.new(key, val)
    link.prev = @tail.prev
    link.next = @tail
    @tail.prev = link
    link.prev.next = link
  end

  def remove(key)

    link = @tail.prev

    until link == @head
      if link.key == key
        next_link = link.next
        next_link.prev = link.prev
        link.prev.next = next_link
      end
      link = link.prev
    end

    nil

  end

  def each
    link = @head.next

    until link == @tail
      yield(link)
      link = link.next
    end

    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
