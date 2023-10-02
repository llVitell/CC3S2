class EtiquetadorDeGenero < CancionDecorator
  def initialize(cancion, genero)
    super(cancion)
    @genero = genero
  end
  
  def reproducir
    puts "Género: #{@genero}"
    super
  end
end
