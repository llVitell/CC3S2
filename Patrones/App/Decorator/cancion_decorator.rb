
class CancionDecorator
    attr_reader :cancion
    
    def initialize(cancion)
      @cancion = cancion
    end
    
    def reproducir
      @cancion.reproducir
    end
end