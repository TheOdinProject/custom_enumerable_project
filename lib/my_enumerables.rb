module Enumerable

  def my_all?
    self.each do |input|
      return false unless yield(input)
    end
    true
  end

  def my_any?
    self.each do |input|
      return true if yield(input)
    end
    false
  end
end

class Array

  def my_each
    for input in self
      yield(input)
    end
    self
  end
end
