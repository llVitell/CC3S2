# Depuracion-Rails

Para solucionar este problema y evitar el error "undefined method 'title' for nil:NilClass", el controlador debe verificar si @movie es nil antes de intentar acceder a sus atributos en la vista:

```Ruby
def show
  id = params[:id] # retrieve movie ID from URI route
  @movie = Movie.find(id) # look up movie by unique ID
  # will render render app/views/movies/show.html.haml by default
  if @movie.nil?
    # Manejar el caso en que la pelicula no se encuentre
  end
end
```

**Muestra la descripción detallada de un objeto en una vista**

En este caso, `@movie.inspect` devolverá una cadena con la representación del objeto `@movie`. El elemento pre se usa para mantener el formato de texto, lo que facilita la lectura de la salida del método inspect.
Al incluir esta línea en la vista, veremos una descripción detallada del objeto `@movie `cuando accedamos a esa vista en la aplicación Rails. 

```haml
-# add to end of index.html.haml
%pre= @movie.inspect 
= link_to 'Add new movie', new_movie_path

%h1 All Movies

%table#movies
  %thead
    %tr
      %th Movie Title
      %th Rating
      %th Release Date
      %th More Info
  %tbody
    - @movies.each do |movie|
      %tr
        %td= movie.title 
        %td= movie.rating
        %td= movie.release_date
        %td= link_to "More about #{movie.title}", movie_path(movie)
```

**Método para detener la ejecución dentro de un método de un controlador**

Cuando se llama al método `some_action`, se lanzará una excepción y se detendrá la ejecución del controlador. La excepción contendrá como mensaje la representación en forma de cadena de los parámetros recibidos. Esto permitirá inspeccionar los valores de los parámetros y depurar el código del controlador.

```Ruby
def some_action
  raise params.inspect
end
```

**Imprimir el mensaje al fichero de logging**

```Ruby
def some_action
  begin
    raise "Params: #{params.inspect}" 
  rescue => e
    logger.debug(e.message)
  end
end
```

**Correr el servidor con el depurador**
1. Nos aseguramos que tenga instalada la gema byebug
2. Insertamos la sentencia `debugger` en el punto exacto del código que queremos que se detenga
3. Ejecutamos el servidor con `rails server --debugger`
