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

```

- Resultados de las pruebas **después** de definir el método:
```shell

```