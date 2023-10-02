class ListaReproduccion
    attr_accessor :nombre
  
    def initialize(nombre)
      @nombre = nombre
      @elementos = []
    end
  
    def agregar(elemento)
      @elementos << elemento
    end
  
    def reproducir
      puts "Reproduciendo lista: #{@nombre}"
      @elementos.each(&:reproducir)
    end
  end