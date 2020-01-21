# #######################################
# Home made methods to learn Ruby language
# #######################################

# Some home made methods for class Array
class Array
  def my_map
    return self.to_enum(:map) unless block_given?

    new_array = []

    my_each { |i| new_array << yield(i) }
    new_array
  end

  def my_each
    return self.to_enum(:each) unless block_given?

    for element in self do
      yield(element)
    end
  end

  def my_each_with_index
    return self.to_enum(:each_with_index) unless block_given?

    i = 0

    for element in self do
      yield(element, i)
      i += 1
    end
  end

  # Need to check if o block given
  def my_inject(init_value = nil)
    result = init_value || self[0]

    my_each_with_index do |i, ind|
      next if ind == 0 && result == self[0]

      result = yield(result, i)
    end
    result
  end

  def my_select
    return self.to_enum(:select) unless block_given?

    new_array = []

    my_each { |i| new_array << i if yield(i) }
    new_array
  end

  def my_clear
    return [] if block_given?

    while self.length > 0
      self.pop
    end

    []
  end

  # Need case with value_find && block
  def my_count(value_find = nil)
    return self.length if value_find.nil? && !block_given?

    if value_find
      result = 0
      my_each { |i| result += 1 if i == value_find }

      return result
    end

    if block_given?
      result = 0
      my_each { |i| result += 1 if yield(i) }

      return result
    end
  end

  def my_empty?
    self == []
  end

  def my_fetch(i = nil, default = nil)
    return self[i] if i > 0 && i < self.my_count

    return self.last if i < 0

    return default unless default.nil?

    return yield(i) if block_given?
  end

  def my_index(value_find = nil)
    return self.to_enum(:index) unless block_given? || value_find

    if block_given?
      my_each_with_index { |value, i| return i if yield(value) }
    else
      my_each_with_index { |value, i| return i if value == value_find }
    end

    nil
  end

  def my_join(jointure = nil)
    new_str = ''
    my_each_with_index do |value, i|
      if value.kind_of?(Array)
        new_str += value.my_join(jointure) 
        next
      end

      new_str += value.to_s
      new_str += jointure if jointure && i < my_count
    end
    new_str
  end
end

p [ "a", [1, 2, [:x, :y]], "b" ].join("-")

p [ "a", [1, 2, [:x, :y]], "b" ].my_join("-")