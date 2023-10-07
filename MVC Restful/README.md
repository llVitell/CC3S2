# MVC-Resful
***
## Configuración
Primero instalamos sinatra y puma con los siguientes comandos
```Shell
gem install sinatra
gem install puma
```
Luego bundle y corremos el programa
```
cd sinatra-intro/
bundle install
ruby template.rb # O: bundle exec ruby template.rb
```
Ingresamos el siguiente enlace http://localhost:4567/todos en nuestro navegador para ver la página web y comprobar que esté funcionando. Este debería ser el resultado

![web](Imagenes/web.jpg)

El comando curl activa una solicitud `GET` para recuperar la lista de "cosas por hacer" y debería recibir una respuesta que se muestra en la salida estándar de la línea de comando.
```Shell
curl http://localhost:4567/todos
```
Este es el resultado en la terminal:
```Shell
[{"id":1,"description":"prepare for discussion section"},{"id":2,"description":"release cc 3s2"}]
```
***
## Parte 1
Usaremos `ActiveRecord` sobre una base de datos SQLite. En esta aplicación, ¿cuál será nuestro modelo y qué operaciones CRUD le aplicaremos?

- **index:** Es el identificador de la tarea creada, por ejemplo en el ejemplo se observa `id:1` entonces para esta tarea su index o id sería 1 y va aumentando dependiendo el número de tareas.
```json
{
    "id": 1,
    "description": "prepare for discussion section"
}
```
- **create:** Usamos el método `POST` para enviar data al servidor (create data).
```Ruby
post '/todos' do
  content_type :json
  todo = Todo.new(description: params[:description])
  if todo.save
    return {msg: "create success"}.to_json
  else
    return {msg: todo.errors}.to_json
  end
end
```
Esto define una ruta en la aplicación web que responde a las solicitudes POST que llegan a la URL '/todos'. Cuando se recibe una solicitud POST en esta ruta, se ejecutará el código dentro de este bloque el cual se enviará al cliente como JSON.

- **read:** El método `GET` se usa para solicitar datos de un recurso especificado (read data) donde los datos no se modifican de ninguna manera.
```Ruby
get '/todos/:id' do
  content_type :json
  todo = Todo.find_by_id(params[:id])
  if todo
    return {description: todo.description}.to_json
  else
    return {msg: "error: specified todo not found"}.to_json
  end
end
```
En este ejemplo cada que se realice una solicitud `GET` en la ruta específica '/todos/:id' obtenemos data correspondiente al id señalado, solo lo muestra mas no lo modifica.
- **update:**El método `PUT` se utiliza para modificar información ya creada previamente (update data), tambien puede ser usado para crear nuevos elementos pero no es recomendable
```Ruby
put '/todos/:id' do
  content_type :json
  todo = Todo.find(params[:id])
  if todo.update_attribute(:description, params[:description])
    return {msg: "update success"}.to_json
  else
    return {msg: todo.errors}.to_json
  end
end
```
En el ejemplo el método `PUT` toma la data por su id y la modifica con el nuevo parametro recibido
- **destroy:**`DELETE` permite eliminar un recurso específico (destroy data). Puede ser ejecutado varias veces y tiene el mismo efecto similar al PUT y GET.
```Ruby
delete '/todos/:id' do
  content_type :json
  todo = Todo.find(params[:id])
  if todo
    todo.destroy
    return {msg: "delete success"}.to_json
  else
    return {msg: "delete failure"}.to_json
  end
end
```
En el bloque de código delete elimina la tarea por su id siguiendo la ruta '/todos/:id'
***
## Parte 2
A continuación, creemos algunas rutas para que los usuarios puedan interactuar con la aplicación. Aquí hay una URL de ejemplo:
```
https://www.etsy.com/search?q=test#copy
```
Primero, especifica qué partes de la URL son componentes según la discusión sobre la forma de una URL. Consulta esta publicación de IBM que detalla los componentes de una URL.

- **https://:** Es el esquema que define el protocolo que se va a usar para acceder al recurso en internet
- **etsy:** Identifica el nombre del host o dominio que suele seguir de un número de puerto pero la mayoría de URLs HTTP omiten este último. 
- **443:** El puerto 443 es el puerto estándar para todo el tráfico HTTP seguro
- **/search:** La ruta que identifica un recurso en específico del host el cual un usuario desea acceder
- **q=test**: Parametros adicionales que sirven para identificar o filtrar data en el servidor.
- **copy:** El "fragment identifier" se utiliza para apuntar un explorador web a una referencia o función en el elemento que acaba de recuperar

***
## Parte 3
Dado que HTTP es un protocolo RESTful, cada solicitud debe ir seguida de una respuesta, por lo que debemos devolver una vista o redirigir a cada solicitud. Usaremos JSON para las respuestas, que es similar a lo que hacen muchas API. ¿Hacia dónde debería ir la respuesta?

- La ubicación hacia donde debe ir la respuesta en una solicitud HTTP depende del estado actual de la aplicación y del recurso solicitado, en la mayoría de casos la respuesta se envía de vuelta al cliente y se sitúa en el **cuerpo** de la respuesta


