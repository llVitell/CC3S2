# JavaScript

***

## Preguntas conceptuales

- **En JavaScript, todas las operaciones de red son asíncronas. ¿Porque es esto importante?**

Por que la asincronía nos permite mejorar la eficiencia y la experiencia del usuario en operaciones de red, como las solicitudes HTTP. 

Además, la asincronía facilita el manejo de múltiples tareas simultáneas, como en aplicaciones web con solicitudes concurrentes permitiendo que el código siga ejecutándose mientras se aguarda la finalización de operaciones de red, lo que contribuye a la escalabilidad y la responsividad de las aplicaciones.

- **En Javascript, queremos realizar acciones tras una operación/solicitud de red completa. ¿Qué paradigma de programación hace esto posible?**

En JavaScript, el paradigma de programación que hace posible realizar acciones tras una operación o solicitud de red completa es la programación asíncrona. La asincronía permite que el programa continúe ejecutándose mientras se espera que se complete una operación de red, y luego ejecuta una función cuando la operación asíncrona finaliza.

- **¿Javascript proporciona soporte limitado para la herencia a través de qué mecanismo?**

JavaScript proporciona soporte para la herencia a través del mecanismo de prototipos. A diferencia de lenguajes orientados a objetos que utilizan clases para definir la estructura de los objetos, JavaScript utiliza prototipos para lograr la herencia.

```JS
function Animal(nombre) {
  this.nombre = nombre;
}

// Agregar un método al prototipo del constructor
Animal.prototype.saludar = function() {
  console.log(`Hola, soy ${this.nombre}`);
};

var perro = new Animal('Max');
perro.saludar();

```

- **¿Qué es el DOM? ¿Qué librería nos ayuda a usar Javascript para manipular el DOM?**

El DOM (Document Object Model) es una interfaz de programación para documentos HTML y XML. Representa la estructura del documento como un árbol de objetos, donde cada nodo del árbol corresponde a una parte del documento (como elementos HTML, atributos, texto, etc.).

Una de las librerías más conocidas y utilizadas para el manejo del DOM es jQuery, la cual simplifica manejo de eventos, animaciones y otras tareas comunes en el desarrollo web.

***

## Booleano

- undefined == null


## Clausura

Un paradigma popular en Javascript es el uso de clausuras. Al igual que las funciones de orden superior en Python, las clausuras son combinaciones de una función agrupada con referencias a su estado circundante. Las clausuras le dan acceso al alcance de una función externa desde una función interna. Determina la salida del siguiente código.

```JS
function f1(x) {
  var baz = 3;
  return function (y) {
    console.log(x + y + (baz++));
    }
}
var bar = f1(5);
bar(11);
```

## Algoritmos

La siguiente función encuentra el mayor número dentro de un array, pero tiene una eficiencia de O(N2). Reescribe la función para que se convierta en una `O(N)``más rápida:

```JS
def greatestNumber(array):
   for i in array:
     isIValTheGreatest = True
     for j in array:
      if j > i:
         isIValTheGreatest = False
    if isIValTheGreatest:
      return i
```

Al tener un bucle dentro de otro se genera una complejidad cuadrática, esto se soluciona así:

```JS
def greatestNumber(array):
    max_number = array[0]
    for i in array:
        if array[i] > max_number
            max_number = array[i]
    return max_number
```

La siguiente función devuelve si hay o no una “X” mayúscula dentro de una cadena.

```JS
function containsX(string){
  foundX = false;
  for(let i = 0; i < string.length; i++) {
   if (string[i] === "X") {
     foundX = true;
     }
   }
   return foundX;
}
```

¿Cuál es la complejidad temporal de esta función en términos de notación O grande? Luego, modifica el código para mejorar la eficiencia del algoritmo en los mejores y promedios escenarios.w

Al haber un bucle que recorre sobre cada elemento del string la complejidad será de O(n) donde n = longitud del array, ya que las asignaciones ni el return cuentan dentro de la complejidad Big O.

Escribe una función que devuelva el primer carácter no duplicado de una cadena. Por ejemplo, la cadena "mínimum" tiene dos caracteres que solo existen una vez: la "n" y la "u", por lo que su función debería devolver la "n", ya que aparece primero. La función debe tener una eficiencia de O(N).

```js
function primerNoDuplicado(cadena) {
    const frecuencia = {};

    for (let i = 0; i < cadena.length; i++) {
        const char = cadena[i];
        frecuencia[char] = (frecuencia[char] || 0) + 1;
    }

    for (let i = 0; i < cadena.length; i++) {
        const char = cadena[i];
        if (frecuencia[char] === 1) {
            return char;
        }
    }

    return null;
}

const cadenaEjemplo = "mínimum";
const resultado = primerNoDuplicado(cadenaEjemplo);
console.log(resultado); 
```

## Clases

- Clase Pokémon

```JS
class Pokemon{
    constructor(hp, atk, def){
        this.hp = hp
        this.atk = atk
        this.def = def
        this.move = ""
        this.lvl = 1
        this.type = ""
    }

    fight(){
        throw new Error("Mov wasnt specified")
    }

    canFly(){
        if(!this.type){
            throw new Error("Type wasnt specified")
        }
        else return this.type.includes("flying")
    }
}
```

- Clase Charizard

```JS
class Charizard extends Pokemon{
    constructor(hp, atk, def, move){
        super(hp,atk,def)
        this.move = move
        this.type = "flying"
    }

    fight(){
        if(this.move){
            console.log(`Charizard is using a movement: ${this.move}`)
            return this.move
        }
        else throw new Error("Movement wasnt specified")
    }
}
```


