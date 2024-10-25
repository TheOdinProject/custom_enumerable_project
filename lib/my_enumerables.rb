module Enumerable

  def my_all?

    self.my_each do |elem|
      unless yield(elem)
        return false
      end
    end
    true
  end

  def my_any?
    
    self.my_each do |elem|
      if yield(elem)
        return true
      end
    end
     false
  end

  def my_count

    if block_given?
      count = 0

      my_each do |elem|
        count += 1 if yield(elem)
      end
      return count
    end
    size
  end

  def my_each_with_index

    if block_given?
      index = -1
      self.my_each do |elem|
        index += 1
        yield(elem, index)
      end
    end
    self
  end

  def my_inject(initial = 100, &block)
    self.inject(initial, &block)
  end

  def my_map(&block)
    if block_given?
      map(&block)
    end
  end

  def my_none?(&block)
    self.none?(&block)
  end

  def my_select(&block)
    self.select(&block)
  end
end

class Array

  def my_each
    if block_given?
     for i in 0...size
        yield(self[i])
     end
     self
    end
  end
end
