# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'anuncio', 'anuncios'
  inflect.irregular 'categoria', 'categorias'
  inflect.irregular 'ciudad', 'ciudades'
  inflect.irregular 'direccion', 'direcciones'
  inflect.irregular 'empresa', 'empresas'
  inflect.irregular 'estado', 'estados'
  inflect.irregular 'industria', 'industrias'
  inflect.irregular 'moneda', 'monedas'
  inflect.irregular 'nivel_anuncio', 'niveles_anuncio'
  inflect.irregular 'pais', 'paises'
  inflect.irregular 'periodicidad_sueldo', 'periodicidades_sueldo'
  inflect.irregular 'sesion', 'sesiones'
  inflect.irregular 'subcategoria', 'subcategorias'
  inflect.irregular 'tipo_trabajo', 'tipos_trabajo'
  inflect.irregular 'tipo_trabajo_anuncio', 'tipos_trabajos_anuncio'
  inflect.irregular 'tipo_usuario', 'tipos_usuario'
  inflect.irregular 'usuario', 'usuarios'
  inflect.irregular 'antiguedad_anuncio', 'antiguedades_anuncio'
end
