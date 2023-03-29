module Enumerable
  # Your code goes here
  def my_each_with_index
    return self.dup unless block_given?
    index = 0
    for elem in self do
      yield elem, index
    index += 1
    end
  end

  def my_select
    return self.dup unless block_given?
    result = []
    for elem in self do
      result << elem if yield(elem) #yield elem is true/false
    end
    result
  end

  def my_all?
    result = true
    if self.kind_of?(Array)
      for elem in self do
        unless yield(elem)
          result = false
        end
      end
    else
      for k, v in self do
        unless yield(k, v)
          result = false
        end
      end
    end
    result
  end

  def my_any?

    result = false
    if self.kind_of?(Array)
      for elem in self do
        if yield(elem)
          result = true
        end
      end
    else
      for k, v in self do
        if yield(k, v)
          result = true
        end
      end
    end
    result
  end

  def my_none?
    result = true
    for elem in self do
      if yield(elem)
        result = false
      end
    end
    result
  end

  def my_count
    return self.size unless block_given?
    count = 0
    for elem in self do
      if yield(elem)
        count += 1
      end
    end
    count
  end 

  def my_map 
    return self.dup unless block_given?
    result = []
    for elem in self do
      result << yield(elem)
    end
    result
  end

  def my_inject(value)
    for elem in self do
      value = yield(value, elem)
    end
    value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return self.dup unless block_given?
    for elem in self do
      yield elem
    end
    self
  end
end
