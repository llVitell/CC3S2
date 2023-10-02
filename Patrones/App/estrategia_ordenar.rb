class EstrategiaOrdenar
    def ordenar(canciones)
      raise NotImplementedError, "Debes implementar el método 'ordenar' en la estrategia concreta."
    end
end

class OrdenarPorArtista < EstrategiaOrdenar
    def ordenar(canciones)
      canciones.select! { |c| c.is_a?(Cancion) } 
      canciones.sort_by! { |c| c.artista }
    end
end

class OrdenarPorTitulo < EstrategiaOrdenar
    def ordenar(canciones)
      canciones.select! { |c| c.is_a?(Cancion) }
      canciones.sort_by! { |c| c.titulo }
    end
end