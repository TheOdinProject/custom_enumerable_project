require 'byebug'

module Enumerable
  # Your code goes here

  def my_all?
    result = true

    my_each { |item| result &&= yield(item) }

    result
  end

  def my_select
    result = []

    my_each { |item| result << item if yield(item) }

    result
  end

  def my_each_with_index
    i = 0
    until i >= size
      yield self[i], i
      i += 1
    end

    self
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield(element)
    end

    self
  end
end
