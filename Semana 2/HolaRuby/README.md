# Parte 1

## Método sum
- Resultados de las pruebas **antes** de definir el método:
```shell
Failures:

  1) Introduccion a Ruby #sum retorna la suma correcta
     Failure/Error: expect(sum([1, 2, 3, 4, 5])).to be_a_kind_of Integer
       expected nil to be a kind of Integer
     # ./spec/parte1_spec.rb:10:in `block (3 levels) in <top (required)>'

  2) Introduccion a Ruby #sum trabaja sobre el arreglo vacio
     Failure/Error: expect(sum([])).to be_zero
       expected nil to respond to `zero?`
     # ./spec/parte1_spec.rb:18:in `block (3 levels) in <top (required)>'

Finished in 0.06309 seconds (files took 0.51701 seconds to load)
3 examples, 2 failures

Failed examples:

rspec ./spec/parte1_spec.rb:9 # Introduccion a Ruby #sum retorna la suma correcta
rspec ./spec/parte1_spec.rb:16 # Introduccion a Ruby #sum trabaja sobre el arreglo vacio
```
- Definimos el método `sum` el cual toma un arreglo de números enteros como argumento y devuelve la suma de sus elementos. Para una matriz vacía devuelve cero.

```Ruby
def sum arr
  suma = 0
  arr.each do |num|
    suma += num
  end
  suma
end
```

- Resultados de las pruebas **después** de definir el método:
```shell
Run options: include {:full_description=>/\#sum\ /}
...

Finished in 0.02331 seconds (files took 0.51766 seconds to load)
3 examples, 0 failures
```
## Método max_2_sum
- Resultados de las pruebas **antes** de definir el método
```shell
Failures:

  1) Introduccion a Ruby #max_2_sum retorna la suma correcta
     Failure/Error: expect(max_2_sum([1, 2, 3, 4, 5])).to be_a_kind_of Integer
       expected nil to be a kind of Integer
     # ./spec/parte1_spec.rb:27:in `block (3 levels) in <top (required)>'

  2) Introduccion a Ruby #max_2_sum trabaja incluso si los dos valores mas grandes son lo mismo
     Failure/Error: expect(max_2_sum([1, 2, 3, 3])).to eq(6)

       expected: 6
            got: nil

       (compared using ==)
     # ./spec/parte1_spec.rb:31:in `block (3 levels) in <top (required)>'

  3) Introduccion a Ruby #max_2_sum retorna cero si el arreglo es vacio
     Failure/Error: expect(max_2_sum([])).to be_zero
       expected nil to respond to `zero?`
     # ./spec/parte1_spec.rb:34:in `block (3 levels) in <top (required)>'

  4) Introduccion a Ruby #max_2_sum retorna el valor del elemento si es solo un elemento
     Failure/Error: expect(max_2_sum([3])).to eq(3)

       expected: 3
            got: nil

       (compared using ==)
     # ./spec/parte1_spec.rb:37:in `block (3 levels) in <top (required)>'

Finished in 0.06961 seconds (files took 0.4799 seconds to load)
5 examples, 4 failures

Failed examples:

rspec ./spec/parte1_spec.rb:26 # Introduccion a Ruby #max_2_sum retorna la suma correcta
rspec ./spec/parte1_spec.rb:30 # Introduccion a Ruby #max_2_sum trabaja incluso si los dos valores mas grandes son lo mismo
rspec ./spec/parte1_spec.rb:33 # Introduccion a Ruby #max_2_sum retorna cero si el arreglo es vacio
rspec ./spec/parte1_spec.rb:36 # Introduccion a Ruby #max_2_sum retorna el valor del elemento si es solo un elemento
```
- Definimos el método `max_2_sum` que toma un arreglo de números enteros como argumento y devuelva la suma de sus dos elementos más grandes. Para un arreglo vacío devuelve cero. Para un arreglo con solo un elemento, devuelve ese elemento.
```ruby
def max_2_sum arr
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  sorted_arr = arr.sort.reverse
  max1 = sorted_arr[0]
  max2 = sorted_arr[1]
  max1 + max2
end

```
- Resultados de las pruebas **después** de definir el método
```shell
Run options: include {:full_description=>/\#max_2_sum/}
.....

Finished in 0.02181 seconds (files took 0.50547 seconds to load)
5 examples, 0 failures
```

## Método sum_to_n?
- Resultados de las pruebas **antes** de definir el método
```shell
Failures:

  1) Introduccion a Ruby #sum_to_n retorna verdadero cuando dos elementos cualesquiera se suman al segundo argumento
     Failure/Error: expect(sum_to_n?([1, 2, 3, 4, 5], 5)).to be true # 2 + 3 = 5

       expected true
            got nil
     # ./spec/parte1_spec.rb:46:in `block (3 levels) in <top (required)>'

  2) Introduccion a Ruby #sum_to_n retorna falso para un unico elemento del arreglo
     Failure/Error: expect(sum_to_n?([0], 0)).to be false

       expected false
            got nil
     # ./spec/parte1_spec.rb:53:in `block (3 levels) in <top (required)>'

  3) Introduccion a Ruby #sum_to_n retorna falso para un arreglo vacior
     Failure/Error: expect(sum_to_n?([], 0)).to be false

       expected false
            got nil
     # ./spec/parte1_spec.rb:59:in `block (3 levels) in <top (required)>'

Finished in 0.06819 seconds (files took 0.50862 seconds to load)
4 examples, 3 failures

Failed examples:

rspec ./spec/parte1_spec.rb:45 # Introduccion a Ruby #sum_to_n retorna verdadero cuando dos elementos cualesquiera se suman al segundo argumento
rspec ./spec/parte1_spec.rb:52 # Introduccion a Ruby #sum_to_n retorna falso para un unico elemento del arreglo
rspec ./spec/parte1_spec.rb:58 # Introduccion a Ruby #sum_to_n retorna falso para un arreglo vacior
```
- Definimos el método `sum_to_n` que toma un arreglo de números enteros y un número entero adicional `n`, como argumentos y devuelve verdadero si dos elementos cualesquiera en el arreglo de enteros suman` n`. `sum_to_n?([], n)` devuelve `false` para cualquier valor de `n`
```ruby
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
```
- Resultados de las pruebas **después** de definir el método
```shell
Run options: include {:full_description=>/\#sum_to_n/}
....

Finished in 0.0143 seconds (files took 0.5777 seconds to load)
4 examples, 0 failures 
```
# Parte 2

## Método hello
- Resultados de las pruebas **antes** de definir el método:
```shell
Failures:

  1) #hello El metodo hello retorna la cadena correcta
     Failure/Error: expect(hello('Checha').class).to eq(String)

       expected: String
            got: NilClass

       (compared using ==)

       Diff:
       @@ -1 +1 @@
       -String
       +NilClass

     # ./spec/parte2_spec.rb:11:in `block (2 levels) in <top (required)>'

Finished in 0.20525 seconds (files took 1.64 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/parte2_spec.rb:10 # #hello El metodo hello retorna la cadena correcta
```
- Definimos un método `hello(name)` que toma una cadena que represente un nombre y devuelve la cadena `"Hello"`, concatenada con el nombre

```Ruby
def hello(name)
  return "Hello, #{name}"
end
```

- Resultados de las pruebas **después** de definir el método:
```shell
Run options: include {:full_description=>/\#hello/}
..

Finished in 0.01036 seconds (files took 0.53038 seconds to load)
2 examples, 0 failures
```
## Método start_with_consonant?
- Resultados de las pruebas **antes** de definir el método:
```shell
Failures:

  1) #starts_with_consonant? clasifica casos verdaderos
     Failure/Error: expect(starts_with_consonant?('v')).to be_truthy, "'v' es una consonante"
       'v' es una consonante
     # ./spec/parte2_spec.rb:23:in `block (2 levels) in <top (required)>'

Finished in 0.09869 seconds (files took 0.74415 seconds to load)
5 examples, 1 failure

Failed examples:

rspec ./spec/parte2_spec.rb:22 # #starts_with_consonant? clasifica casos verdaderos
```
- Definimos un método `start_with_consonant?(n)` que toma una cadena y devuelve verdadero si comienza con una consonante y falso en caso contrario.

```Ruby
def starts_with_consonant? s
  return false if s.empty?
  
  if s[0].match(/[^aeiouAEIOU\s\W\d]/)
    return true
  end

  false
end
```

- Resultados de las pruebas **después** de definir el método:
```shell
Run options: include {:full_description=>/\#starts_with_consonant\?/}
.....

Finished in 0.01385 seconds (files took 0.85151 seconds to load)
5 examples, 0 failures
```

## Método binary_multiple_de_4?
- Resultados de las pruebas **antes** de definir el método:
```shell
Failures:

  1) #binary_multiple_of_4? clasifica numeros binarios validos
     Failure/Error: expect(binary_multiple_of_4?(string)).to be_truthy,  "Resultado incorrecto para la entrada: \"#{string}\""
       Resultado incorrecto para la entrada: "1010101010100"
     # ./spec/parte2_spec.rb:48:in `block (3 levels) in <top (required)>'
     # ./spec/parte2_spec.rb:47:in `each'
     # ./spec/parte2_spec.rb:47:in `block (2 levels) in <top (required)>'

Finished in 0.09669 seconds (files took 0.70399 seconds to load)
3 examples, 1 failure

Failed examples:

rspec ./spec/parte2_spec.rb:46 # #binary_multiple_of_4? clasifica numeros binarios validos
```
- Definimos un método `binary_multiple_de_4?(s)` que toma una cadena y devuelve verdadero si la cadena representa un número binario que es múltiplo de 4, como '1000'.
```Ruby
def binary_multiple_of_4? s
  if s.match?(/^[01]+$/)
    binary_number = s.to_i(2)
    return binary_number % 4 == 0
  end

  return false
end
```

- Resultados de las pruebas **después** de definir el método:
```shell
Run options: include {:full_description=>/\#binary_multiple_of_4\?/}
...

Finished in 0.03363 seconds (files took 2.05 seconds to load)
3 examples, 0 failures
```
# Parte 3

## Class BookInStock
- Resultados de las pruebas **antes** de definir la clase:
```shell
Failures:

  1) BookInStock getters and setters debe establecer ISBN
     Failure/Error: before(:each)  { @book = BookInStock.new('isbn1', 33.8) }

     ArgumentError:
       wrong number of arguments (given 2, expected 0)
     # ./spec/parte3_spec.rb:11:in `initialize'
     # ./spec/parte3_spec.rb:11:in `new'
     # ./spec/parte3_spec.rb:11:in `block (3 levels) in <top (required)>'

  2) BookInStock getters and setters deberia establecer el precio
     Failure/Error: before(:each)  { @book = BookInStock.new('isbn1', 33.8) }

     ArgumentError:
       wrong number of arguments (given 2, expected 0)
     # ./spec/parte3_spec.rb:11:in `initialize'
     # ./spec/parte3_spec.rb:11:in `new'
     # ./spec/parte3_spec.rb:11:in `block (3 levels) in <top (required)>'

  3) BookInStock getters and setters deberia cambiar el ISBN
     Failure/Error: before(:each)  { @book = BookInStock.new('isbn1', 33.8) }

     ArgumentError:
       wrong number of arguments (given 2, expected 0)
     # ./spec/parte3_spec.rb:11:in `initialize'
     # ./spec/parte3_spec.rb:11:in `new'
     # ./spec/parte3_spec.rb:11:in `block (3 levels) in <top (required)>'

  4) BookInStock getters and setters deberia cambiar el precio
     Failure/Error: before(:each)  { @book = BookInStock.new('isbn1', 33.8) }

     ArgumentError:
       wrong number of arguments (given 2, expected 0)
     # ./spec/parte3_spec.rb:11:in `initialize'
     # ./spec/parte3_spec.rb:11:in `new'
     # ./spec/parte3_spec.rb:11:in `block (3 levels) in <top (required)>'

Finished in 0.00223 seconds (files took 0.51902 seconds to load)
4 examples, 4 failures

Failed examples:

rspec ./spec/parte3_spec.rb:12 # BookInStock getters and setters debe establecer ISBN
rspec ./spec/parte3_spec.rb:15 # BookInStock getters and setters deberia establecer el precio
rspec ./spec/parte3_spec.rb:18 # BookInStock getters and setters deberia cambiar el ISBN
rspec ./spec/parte3_spec.rb:22 # BookInStock getters and setters deberia cambiar el precio
```
- Define una clase `BookInStock` que representa un libro con un número ISBN, isbn y el precio del libro como número de punto flotante, precio, como atributos

```Ruby
class BookInStock
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    @isbn = isbn
    @price = price
  end

end
```

- Resultados de las pruebas **después** de definir la clase:
```shell
Run options: include {:full_description=>/getters\ and\ setters/}
....

Finished in 0.01664 seconds (files took 0.515 seconds to load)
4 examples, 0 failures
```
## Constructor
- Resultados de las pruebas **antes** de definir el constructor:
```shell
Failures:

  1) BookInStock constructor debe rechazar el numero ISBN no valido
     Failure/Error: expect { BookInStock.new('', 25.00) }.to raise_error(ArgumentError)
       expected ArgumentError but nothing was raised
     # ./spec/parte3_spec.rb:29:in `block (3 levels) in <top (required)>'

  2) BookInStock constructor debe rechazar el precio cero
     Failure/Error: expect { BookInStock.new('isbn1', 0) }.to raise_error(ArgumentError)
       expected ArgumentError but nothing was raised
     # ./spec/parte3_spec.rb:32:in `block (3 levels) in <top (required)>'

  3) BookInStock constructor debe rechazar el precio negativo
     Failure/Error: expect { BookInStock.new('isbn1', -5.0) }.to raise_error(ArgumentError)
       expected ArgumentError but nothing was raised
     # ./spec/parte3_spec.rb:35:in `block (3 levels) in <top (required)>'

Finished in 0.14978 seconds (files took 0.5015 seconds to load)
3 examples, 3 failures

Failed examples:

rspec ./spec/parte3_spec.rb:28 # BookInStock constructor debe rechazar el numero ISBN no valido
rspec ./spec/parte3_spec.rb:31 # BookInStock constructor debe rechazar el precio cero
rspec ./spec/parte3_spec.rb:34 # BookInStock constructor debe rechazar el precio negativo
```
- El constructor acepta el número ISBN como primer argumento y el precio como segundo argumento y genera `ArgumentError` si el número ISBN es la cadena vacía o si el precio es menor o igual a cero.

```Ruby
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

end
```

- Resultados de las pruebas **después** de definir el constructor:
```shell
Run options: include {:full_description=>/constructor/}
...

Finished in 0.00736 seconds (files took 0.5455 seconds to load)
3 examples, 0 failures
```
## Método price_as_string
- Resultados de las pruebas **antes** de definir el método:
```shell
Failures:

  1) BookInStock #price_as_string esto deberia ser definido
     Failure/Error: expect(BookInStock.new('isbn1', 10)).to respond_to(:price_as_string)
       expected #<BookInStock:0x0000019ace4d0890 @isbn="isbn1", @price=10> to respond to :price_as_string
     # ./spec/parte3_spec.rb:40:in `block (3 levels) in <top (required)>'

  2) BookInStock #price_as_string debe mostrar 33.95 como "$33.95"
     Failure/Error: expect(BookInStock.new('isbn11', 33.95).price_as_string).to eq('$33.95')

     NoMethodError:
       undefined method `price_as_string' for #<BookInStock:0x0000019ace393568 @isbn="isbn11", @price=33.95>
     # ./spec/parte3_spec.rb:43:in `block (3 levels) in <top (required)>'

  3) BookInStock #price_as_string debe mostrar  1.1 como $1.10
     Failure/Error: expect(BookInStock.new('isbn11', 1.1).price_as_string).to eq('$1.10')

     NoMethodError:
       undefined method `price_as_string' for #<BookInStock:0x0000019ace2fe760 @isbn="isbn11", @price=1.1>
     # ./spec/parte3_spec.rb:46:in `block (3 levels) in <top (required)>'

  4) BookInStock #price_as_string debe mostrar  20 como $20.00
     Failure/Error: expect(BookInStock.new('isbn11', 20).price_as_string).to eq('$20.00')

     NoMethodError:
       undefined method `price_as_string' for #<BookInStock:0x0000019ace2fbf88 @isbn="isbn11", @price=20>
     # ./spec/parte3_spec.rb:49:in `block (3 levels) in <top (required)>'

Finished in 0.0634 seconds (files took 0.4831 seconds to load)
4 examples, 4 failures

Failed examples:

rspec ./spec/parte3_spec.rb:39 # BookInStock #price_as_string esto deberia ser definido
rspec ./spec/parte3_spec.rb:42 # BookInStock #price_as_string debe mostrar 33.95 como "$33.95"
rspec ./spec/parte3_spec.rb:45 # BookInStock #price_as_string debe mostrar  1.1 como $1.10
rspec ./spec/parte3_spec.rb:48 # BookInStock #price_as_string debe mostrar  20 como $20.00
```
- El método price_as_string devuelve el precio del libro formateado con un signo de dólar inicial y dos decimales, es decir, un precio de 20 debe tener el formato $20.00 y un precio de 33.8 debe tener el formato $33.80.

```Ruby
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
```

- Resultados de las pruebas **después** de definir el método:
```shell
Run options: include {:full_description=>/\#price_as_string/}
....

Finished in 0.00935 seconds (files took 0.48902 seconds to load)
4 examples, 0 failures
```
