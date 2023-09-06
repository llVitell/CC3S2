# CC3S2
class Pelicula // llamada a un objeto asignando la clase pelicula  (no declara como en java) 
                                        
  def initialize(titulo, fecha)  // constructor por defecto que se utiliza en Pelicula.new
    @titulo = titulo // se establecen las variables de instancia
    @fecha = fecha
  end
  
  def titulo // metodo getter
    @titulo
  end
  
  def titulo=(nuevo_titulo) // metodo setter
    @titulo = nuevo_titulo
  end
  
  def fecha ; @fecha ; end // metodo getter usando ;
  
  def fecha=(nueva_fecha) ; @fecha = nueva_fecha ; end // metodo setter usando ;
  
  # Como se muestra la informacion de la pelicula
  
  @@incluye_fecha = false // variable de clase 
  
  def Pelicula.incluye_fecha=(nuevo_valor) // metodo para incluir la fecha en el titulo completo
    @@incluye_fecha = nuevo_valor
  end
  
  def titulo_completo // metodo para imprimir el titulo completo
    if @@incluye_fecha
      "#{self.titulo} (#{self.fecha})"
    else
      self.titulo
    end
  end
  
end

# Ejemplo de uso de la clase Pelicula

pasajero = Pelicula.new('Alien, el octavo pasajero ', '1979')

# Nombre de la pelicula
puts "Estoy viendo #{pasajero.titulo_completo}"

#Fecha de la pelicula
Pelicula.incluye_fecha = true
puts "Estoy viendo #{pasajero.titulo_completo}"

# Cambio de titulo
pasajero.titulo = 'Alien, el octavo pasajero'
puts "El Nostromo alli '#{pasajero.titulo}!'"
