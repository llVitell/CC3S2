class ContadorDeReproducciones < CancionDecorator
  def initialize(cancion)
    super(cancion)
    @reproducciones = 0
  end
  
  def reproducir
    @reproducciones += 1
    puts "Reproducciones: #{@reproducciones}"
    super
  end
end
