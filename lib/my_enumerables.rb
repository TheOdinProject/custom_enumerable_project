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

  def my_count(&block)
    if block_given?
      count(&block)
    else
      self.count
    end
  end

  def my_each_with_index
    if block_given?
      self.each_with_index do |elem, index|
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
      self.each do |elem|
        yield(elem)
      end
      self
    end
  end
end
