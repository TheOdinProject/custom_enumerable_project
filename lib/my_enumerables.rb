module Enumerable
  # Your code goes here
  def my_all?
    my_each do |elem|
      return false unless yield(elem)
    end
    true
  end


  def my_any?
    my_each do |elem|
      return true if yield(elem)
    end
    false
  end


  def my_count
    count = 0
    if block_given?
      my_each do |elem|
        if yield(elem) === true
          count += 1
        end
      end
    else
      count = self.length
    end
    return count
  end


  def my_each_with_index
    index = 0
    my_each do |elem|
      yield(elem, index)
      index += 1
    end
  end


  def my_inject(value)
    my_each do |elem|
      value = yield(value, elem)
    end
    value
  end
  

  def my_map
    new_arr = []
    my_each do |elem|
      new_arr << yield(elem)
    end
    new_arr
  end


  def my_none?
    my_each do |elem|
      if yield(elem)
        return false
      end
      return true
    end
  end


  def my_select
    new_arr = []
    my_each do |elem|
      if yield(elem)
        new_arr << elem
      end
    end
    new_arr
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self
      yield(elem)
    end
  end
end