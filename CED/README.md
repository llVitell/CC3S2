# CED

Para esta tarea vamos a utilizar la actividad `HolaRuby` con el fin de dar a entender el propósito del `clean code` & `exception handling` de una manera práctica y fácil de entender

***

Con el auge de la programación orientada a objetos (POO), la compatibilidad con excepciones se ha convertido en un elemento crucial de los lenguajes de programación modernos. Hoy en día, la mayoría de los idiomas cuentan con un sólido sistema de gestión de excepciones. 

Por ejemplo, Ruby proporciona el siguiente patrón típico:

```Ruby
begin
  do_something_that_might_not_work!
rescue SpecificError => e
  do_some_specific_error_clean_up
  retry if some_condition_met?
ensure
  this_will_always_be_executed
end
```

En si no hay nada mal con el código, pero estos patrones pueden generar `code smells`. Entonces para mantener el código legible, mantenible y escalable usaremos un jerarguía de `ApplicationError` para tratar las excepciones.

Por ejemplo:

```Ruby
class ApplicationError < StandardError; end

# Validation Errors
class ValidationError < ApplicationError; end
class RequiredFieldError < ValidationError; end
class UniqueFieldError < ValidationError; end

# HTTP 4XX Response Errors
class ResponseError < ApplicationError; end
class BadRequestError < ResponseError; end
class UnauthorizedError < ResponseError; end
# ...
```

Y por qué hacerlo así? Pues es más facil leer

```ruby
rescue ValidationError => e
```

Que leer

```ruby
rescue RequiredFieldError, UniqueFieldError, ... => e
```
***

## Código Limpio & Manejo de Excepciones

1. Veamos cómo se muestra un error en nuestro código de `HolaRuby`

- Tenemos el siguiente método

```Ruby
def sum arr
  suma = 0
  arr.each do |num|
    suma += num
  end
  suma
end
```

- Lo implementamos de una manera errónea para ver el resultado

```Ruby
require('./ruby_intro.rb')

puts (sum(1))
```

- Resultado:

```Shell
undefined method `each' for 1:Integer (NoMethodError)
```

2. Creamos la clase `ApplicationError`
```Ruby
class ApplicationError < StandardError
    attr_reader :code
  
    def initialize(message, code = nil)
      super(message)
      @code = code
    end
end
```

- `ValidationError` para errores de validación

```Ruby
class ValidationError < ApplicationError
    def initialize(message, code = nil)
      super(message, code || 400)
    end
end
```

- `NotFoundError` para errores no definidos

```Ruby
class NotFoundError < ApplicationError
    def initialize(message, code = nil)
      super(message, code || 404)
    end
end
```

- `UnathorizedError` para errores de autorización

```Ruby
class UnauthorizedError < ApplicationError
    def initialize(message, code = nil)
      super(message, code || 401)
    end
end
```

3. Implementamos la clase en nuestro código fuente `ruby_intro.rb`

```Ruby
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
```

4. Resultado de forzar el error:

```Shell
La entrada debe ser un arreglo (ValidationError)
```

Comparado con el error del inicio: 

```Shell
undefined method each for 1:Integer (NoMethodError)
``` 

Así como manejamos los errores tambien debemos evitar generalizar en exceso los manejadores de excepciones, ya que oculta la lógica de la aplicación y limita la capacidad del desarrollador. 

Es esencial definir la responsabilidad única de una clase o método y manejar solo las excepciones necesarias para cumplir con esa responsabilidad. Al hacerlo, se mejora la extensibilidad y mantenimiento del código, evitando bloques de código con demasiadas responsabilidades y permitiendo un manejo más específico de excepciones en diferentes partes de la aplicación.

***
## Error Hadling

En Javascript se pueden manejar tanto errores como excepciones.

**Errores**

Los errores en JavaScript son básicamente objetos que representan una circunstancia excepcional en el programa. Estos objetos de error se pueden crear utilizando el constructor Error o alguna de sus subclases, como TypeError, ReferenceError o SyntaxError. 

Cuando se crea un objeto de error, puedes lanzarlo utilizando la declaración throw para señalar que se ha producido una excepción.

```Js
throw new Error("Error.");
```

Así como en Ruby también se puede implementar nuestros propios Errores personalizados para que sean más legibles.
```JS
class CustomError extends Error {
  constructor(message) {
    super(message);
    this.name = "CustomError";
  }
}

try {
  throw new CustomError("This is a custom error.");
} catch (error) {
  if (error instanceof CustomError) {
    console.error("Caught a CustomError:", error.message);
  } else {
    console.error("Caught an unknown error:", error.message);
  }
}
```

**Excepciones**

En JS se puede utilizar bloques `try`, `catch` y `finally`. El bloque `try` contiene el código que podría generar una excepción.

Si ocurre una excepción, se ejecuta el código en el bloque `catch`. El bloque `finally` contiene código que siempre se ejecutará, independientemente de si se lanzó una excepción o no.

```Js
try {
  // Code that might throw an exception
} catch (error) {
  // Code to handle the exception
} finally {
  // Code to be executed regardless of whether an exception was thrown or not
}
```
***

## Debugging Techniques

La manera más sencilla de depurar código en js es usando el `console.log()` statement para mostrar mensajes o valores en la consola.

```JS
console.log("Depura tu código.")
```

La otra manera es utilizando el `debugger` statement que nos permite pausar la ejecución del código e inspeccionar información importante.

```JS
function add(a, b) {
  debugger; // Pauses execution here
  return a + b;
}

add(1, 2);
```
***

En resumen ambos lenguajes utilizan estructuras similares para el manejo de excepciones, pero las clases específicas de excepciones y algunos detalles de implementación pueden variar. Como por ejemplo la aplicación de jerarquías en Ruby que no es recomendable usarla en javascript por sus funciones try, catch y finally.

***

## Arquitectura Orientada a Microservicios

La arquitectura de microservicios permite una mayor escalabilidad al permitir que cada microservicio sea independiente y escalable individualmente. 

Facilita el despliegue independiente de servicios, lo que favorece la implementación continua y entrega continua. Además, los microservicios están diseñados para ser independientes y desacoplados, lo que facilita la evolución y mantenimiento de cada componente de manera independiente. 

Sin embargo, esta ventaja puede introducir una mayor complejidad operativa al gestionar múltiples servicios, su comunicación y posiblemente la orquestación de contenedores.

***

## Cliente Servidor en Rails

En una arquitectura monolítica como Rails, la escalabilidad puede ser desafiante, ya que implica escalar la aplicación en su totalidad. Esto puede generar limitaciones en escalabilidad a medida que la aplicación crece. 

El despliegue suele realizarse en su conjunto, llevando a ciclos de desarrollo y despliegue más extensos. La arquitectura monolítica conlleva un mayor acoplamiento entre componentes, lo que hace que los cambios en una área afecten a otras, complicando el mantenimiento. 

Además, al compartir un mismo contexto, la aplicación monolítica tiende a utilizar una tecnología y conjunto de herramientas específicos. Sin embargo, este enfoque suele tener una menor complejidad operativa al contener todo dentro de la aplicación monolítica.



