# ActiveRecord
***
## Información de Contexto

- En el directorio ejecutamos bundle install para instalar las gemas
```Shell
bundle install
```
En caso se den problemas de compatibilidad borrar el gemfilelock y verificar que las versiones especificads en el gemfile coincidan
- Ejecuta el archivo de prueba una vez con

```Shell
bundle exec rspec spec/activerecord_practica_spec.rb
```

Recuerda que bundle exec es necesario para garantizar que las versiones
correctas de las gemas requeridas se carguen y activen correctamente antes de ejecutar el código. El resultado debe ser 13 ejemplos, 0 fallas, 13 pendientes.

```Shell
1) Practica ActiveRecord para encontrar using .where: cualquier persona con el nombre Candice
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:39

  2) Practica ActiveRecord para encontrar using .where: con un correo electrónico válido (la dirección de correo electrónico contiene "@") (busca el operador SQL LIKE)
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:42

  3) Practica ActiveRecord para encontrar using .where: con emails .org
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:45

  4) Practica ActiveRecord para encontrar using .where: con correo electronico no valido pero que no este en blanco (no contiene "@")
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:48

  5) Practica ActiveRecord para encontrar using .where: con correo electronico en blanco
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:51

  6) Practica ActiveRecord para encontrar using .where: nacido antes del 1 Enero 1980
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:54

  7) Practica ActiveRecord para encontrar using .where: con correo electronico valido Y nacidos antes del 1/1/1980
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:57

  8) Practica ActiveRecord para encontrar using .where: con apellidos que comienzan con "B", ordenados por fecha de nacimiento
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:60

  9) Practica ActiveRecord para encontrar sin necesidad de .where 20 clientes mas jovenes, en cualquier orden (busca ActiveRecord "order" y "limit")
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:65

  10) Practica ActiveRecord para actualizar la fecha de nacimiento de Gussie Murray hasta el 8 de febrero de 2004 (busca `Time.parse`)
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:74

  11) Practica ActiveRecord para actualizar Todos los correos electronicos no validos deben estar en blanco.
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:78

  12) Practica ActiveRecord para actualizar base de datos eliminando al cliente Meggie Herman
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:82

  13) Practica ActiveRecord para actualizar base de datos eliminando todos los clientes nacidos el 31 de diciembre de 1977
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:86


Finished in 0.01885 seconds (files took 8.44 seconds to load)
13 examples, 0 failures, 13 pending
```

Abre el specfile  y echa un vistazo. tu flujo de trabajo será el siguiente:

1. Escoge  un ejemplo para trabajar (recomendamos hacerlo en orden). Cada ejemplo (caso de prueba) comienza con `xspecify`.
2. En ese ejemplo, cambia `xspecify` por `specify` y guarda el archivo. Este cambio hará que esa prueba en particular no se omita en la siguiente ejecución de prueba.
3. La prueba fallará inmediatamente porque no has escrito el código necesario.
4. Escribiras el código necesario y aprobarás la prueba, luego pasa al siguiente ejemplo.
***
## Automatizar el flujo de trabajo usando Guard
Hemos configurado guard aquí para que cada vez que cambies el archivo `specfile` o `activerecord_practica.rb`,  vuelvas a ejecutar todas las pruebas que comiencen con `spec` (a diferencia de `xspecify`). 

- En una ventana de terminal, escribe `guard`. Deberías ver algo como: "Guard is now watching...". En windows el resultado es el siguiente:

```Shell
Warning: you have a Gemfile, but you're not using bundler or RUBYGEMS_GEMDEPS
17:58:15 - INFO - Run 'gem install win32console' to use color on Windows
17:58:17 - INFO - Guard::RSpec is running
[1] guard(main)>
```
Aunque veas un prompt `(guard(main)>)`, no necesitas escribir nada. En una ventana del editor, realiza un cambio trivial en el specfile o en `activerecord_practica.rb`, como insertar un espacio, y guarda el archivo. En uno o dos segundos, la ventana de terminal que ejecuta Guard debería cobrar vida cuando Guard intenta volver a ejecutar las pruebas.
***

## Como pasar un ejemplo

Trabaja en el primer ejemplo que se enumera en el resultado de `rspec`. ¿Cuál es la salida que debería mostrarse?
```Shell
1) Practica ActiveRecord para encontrar using .where: cualquier persona con el nombre Candice
     # Temporarily skipped with xspecify
     # ./spec/activerecord_practica_spec.rb:39
```
Como sugiere el resultado, echa un vistazo a la linea `xspecify 'alguien con el nombre de Candice'`. En el cuerpo del caso de prueba, puedes ver que la prueba intentará llamar al método de clase `Customer.any_candice`. Cambia `xspecify` por `specify`  guarda el specfile  y Guard debería ejecutar las pruebas una vez más,  pero esta vez, la prueba número 1 no se omitirá sino que fallará.
```Shell
13 examples, 1 failure, 12 pending

Failed examples:

rspec ./spec/activerecord_practica_spec.rb:39 # Practica ActiveRecord para encontrar using .where: cualquier persona con el nombre Candice
```
Ahora ve a `lib/activerecord_practica.rb` donde hemos definido un método vacío `Customer.any_candice`. Completa el cuerpo de este método para que devuelva el enumerable de objetos `Customer` cuyos nombres coincidan con "Candice". (Recordatorio: el archivo `customers.csv` contiene una versión exportada del contenido de `customers.sqlite3`, que es la base de datos utilizada por este código).

```Ruby
def self.any_candice
   Customer.where(first: 'Candice')
end
```
Cada vez que realizas un cambio y guardaa `activerecord_practica.rb`, Guard volverá a ejecutar las pruebas.
***
## Pruebas
- Con emails .org

```Ruby
  def self.with_dot_org_email
    Customer.where("email LIKE '%.org'")
  end
```

- Con correo electronico no valido pero que no este en blanco (no contiene "@")

```Ruby
  def self.with_invalid_email
    Customer.where.not(email: nil).where.not(email: '').where.not("email LIKE '%@%'")
  end
```

- Con correo electronico en blanco

```Ruby
  def self.with_blank_email
    Customer.where(email: nil)
  end
```

- Nacido antes del 1 Enero 1980

```Ruby
  def self.born_before_1980
    Customer.where("birthdate < ?", Date.parse("1980-01-01"))
  end
```

- Con correo electronico valido Y nacidos antes del 1/1/1980

```Ruby
  def self.with_valid_email_and_born_before_1980
    Customer.with_valid_email.born_before_1980
  end
```

- Con apellidos que comienzan con "B", ordenados por fecha de nacimiento

```Ruby
  def self.last_names_starting_with_b
    Customer.where("last LIKE 'B%'").order(:birthdate)
  end
```

### Sin necesidad de where

- 20 clientes mas jovenes, en cualquier orden (busca ActiveRecord "order" y "limit")

```Ruby
  def self.twenty_youngest
    Customer.order(:birthdate).limit(20)
  end
```

- La fecha de nacimiento de Gussie Murray hasta el 8 de febrero de 2004 (busca `Time.parse`)

```Ruby
  def self.update_gussie_murray_birthdate
    gussie_murray = Customer.find_by(first: 'Gussie', last: 'Murray')
    gussie_murray.update(birthdate: Time.parse('2004-02-08').to_date)
  end
```

- Todos los correos electronicos no validos deben estar en blanco.

```Ruby
  def self.change_all_invalid_emails_to_blank
    Customer.where.not(email: nil).where("email NOT LIKE '%@%'").update_all(email: '')
  end
```

- Base de datos eliminando al cliente Meggie Herman

```Ruby
  def self.delete_meggie_herman
    meggie_herman = Customer.find_by(first: 'Meggie', last: 'Herman')
    meggie_herman.destroy if meggie_herman
  end
```

- Base de datos eliminando todos los clientes nacidos el 31 de diciembre de 1977

```Ruby
  def self.delete_everyone_born_before_1978
    Customer.where("birthdate < ?", Date.parse("1978-01-01")).destroy_all
  end
```
