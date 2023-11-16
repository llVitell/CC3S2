# Parte 1
require('./application_error.rb')

def sum(arr)
  raise RequiredFieldError.new("El arreglo no puede ser nulo") if arr.nil?
  raise ValidationError.new("La entrada debe ser un arreglo") unless arr.is_a?(Array)

  suma = 0
  arr.each do |num|
    raise ValidationError.new("Los elementos del arreglo deben ser números") unless num.is_a?(Numeric)

    suma += num
  end
  suma
end

def max_2_sum arr
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  sorted_arr = arr.sort.reverse
  max1 = sorted_arr[0]
  max2 = sorted_arr[1]
  max1 + max2
end

def sum_to_n? arr, n
  return false if arr.empty?

  valores_vistos = Set.new

  arr.each do |num|
    complemento = n - num

    if valores_vistos.include?(complemento)
      return true
    end

    valores_vistos.add(num)
  end

  false
end

# Parte 2

def hello(name)
  return "Hello, #{name}"
end

def starts_with_consonant? s
  return false if s.empty?
  
  if s[0].match(/[^aeiouAEIOU\s\W\d]/)
    return true
  end

  false
end

def binary_multiple_of_4? s
  if s.match?(/^[01]+$/)
    binary_number = s.to_i(2)
    return binary_number % 4 == 0
  end

  return false
end

# Parte 3

class BookInStock
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    if isbn.empty? 
      raise ArgumentError, "El ISBN no puede ser vacío"
    end
    if price <= 0 
      raise ArgumentError, "El precio debe ser mayor que cero"
    end
    @isbn = isbn
    @price = price
  end

  def price_as_string
    "$%.2f" % @price
  end

end
