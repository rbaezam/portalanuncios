module AnunciosHelper

  def sueldo_de(anuncio)

    cadena = ""
    simbolo_moneda = anuncio.moneda.simbolo unless anuncio.moneda.nil?
    periodicidad = anuncio.periodicidad_sueldo.nombre unless anuncio.periodicidad_sueldo.nil?

    if anuncio.sueldo_minimo != anuncio.sueldo_maximo

      cadena = "De %s a %s %s" % [
          number_to_currency(anuncio.sueldo_minimo, :unit => simbolo_moneda),
          number_to_currency(anuncio.sueldo_maximo, :unit => simbolo_moneda),
          periodicidad
      ]
    else
      cadena = "%s %s" % [number_to_currency(anuncio.sueldo_minimo, :unit => simbolo_moneda), periodicidad]
    end

    return cadena
  end

  def localidad_de(anuncio)
    cadena = ""

    if not anuncio.ciudad.nil? and not anuncio.ciudad.estado.nil?
      cadena = "%s, %s" % [anuncio.ciudad.nombre, anuncio.ciudad.estado.nombre]
    end

    return cadena
  end
end
