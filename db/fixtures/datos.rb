Pais.seed(:id) do |p|
  p.id = 1
  p.nombre = "México"
end

Estado.seed(:id) do |s|
  s.id = 1
  s.pais_id = 1
  s.nombre = "Quintana Roo"
end

Estado.seed(:id) do |s|
  s.id = 2
  s.pais_id = 1
  s.nombre = "Yucatán"
end

Estado.seed(:id) do |s|
  s.id = 3
  s.pais_id = 1
  s.nombre = "Jalisco"
end

Estado.seed(:id) do |s|
  s.id = 4
  s.pais_id = 1
  s.nombre = "Estado de México"
end

Estado.seed(:id) do |s|
  s.id = 5
  s.pais_id = 1
  s.nombre = "Nuevo León"
end

Ciudad.seed(:id) do |s|
  s.id = 1
  s.nombre = "Chetumal"
  s.estado_id = 1
end

Ciudad.seed(:id) do |s|
  s.id = 2
  s.nombre = "Cancún"
  s.estado_id = 1
end

Ciudad.seed(:id) do |s|
  s.id = 3
  s.nombre = "Mérida"
  s.estado_id = 2
end

Ciudad.seed(:id) do |s|
  s.id = 4
  s.nombre = "Guadalajara"
  s.estado_id = 3
end

Ciudad.seed(:id) do |s|
  s.id = 5
  s.nombre = "Zapopan"
  s.estado_id = 3
end

Ciudad.seed(:id) do |s|
  s.id = 6
  s.nombre = "Toluca"
  s.estado_id = 4
end

Ciudad.seed(:id) do |s|
  s.id = 7
  s.nombre = "Monterrey"
  s.estado_id = 5
end

Industria.seed(:id) do |s|
  s.nombre = "Gobierno"
end

Industria.seed(:id) do |s|
  s.nombre = "Turismo"
end

Industria.seed(:id) do |s|
  s.nombre = "Comercio"
end

Industria.seed(:id) do |s|
  s.nombre = "Tecnología"
end

TipoTrabajo.seed(:id) do |s|
  s.nombre = "Fijo"
end

TipoTrabajo.seed(:id) do |s|
  s.nombre = "Temporal"
end

TipoTrabajo.seed(:id) do |s|
  s.nombre = "Por horas"
end

TipoTrabajo.seed(:id) do |s|
  s.nombre = "Medio tiempo"
end

TipoTrabajo.seed(:id) do |s|
  s.nombre = "Desde casa"
end

Categoria.seed(:id) do |s|
  s.id = 1
  s.nombre = "Gobierno"
end

Categoria.seed(:id) do |s|
  s.id = 2
  s.nombre = "Comercio"
end

Categoria.seed(:id) do |s|
  s.id = 3
  s.nombre = "Turismo"
end

Categoria.seed(:id) do |s|
  s.id = 4
  s.nombre = "Tecnologia"
end

Subcategoria.seed(:id) do |s|
  s.nombre = "Ventas"
  s.categoria_id = 2
end

Subcategoria.seed(:id) do |s|
  s.nombre = "Local"
  s.categoria_id = 1
end

Subcategoria.seed(:id) do |s|
  s.nombre = "Federal"
  s.categoria_id = 1
end

Subcategoria.seed(:id) do |s|
  s.nombre = "Municipal"
  s.categoria_id = 3
end

Subcategoria.seed(:id) do |s|
  s.nombre = "Hoteles"
  s.categoria_id = 3
end

Subcategoria.seed(:id) do |s|
  s.nombre = "Restaurantes"
  s.categoria_id = 3
end

Subcategoria.seed(:id) do |s|
  s.nombre = "Desarrollo de software"
  s.categoria_id = 4
end

Subcategoria.seed(:id) do |s|
  s.nombre = "Redes y telecomunicaciones"
  s.categoria_id = 4
end

Subcategoria.seed(:id) do |s|
  s.nombre = "Diseño"
  s.categoria_id = 4
end

PeriodicidadSueldo.seed(:id) do |s|
  s.nombre = "Mensual"
  s.num_horas = 720
end

PeriodicidadSueldo.seed(:id) do |s|
  s.nombre = "Quincenal"
  s.num_horas = 360
end

PeriodicidadSueldo.seed(:id) do |s|
  s.nombre = "Diario"
  s.num_horas = 24
end

PeriodicidadSueldo.seed(:id) do |s|
  s.nombre = "Anual"
  s.num_horas = 8760
end

PeriodicidadSueldo.seed(:id) do |s|
  s.nombre = "Por hora"
  s.num_horas = 1
end

PeriodicidadSueldo.seed(:id) do |s|
  s.nombre = "Semanal"
  s.num_horas = 168
end

Moneda.seed(:id) do |s|
  s.nombre = "Peso"
  s.simbolo = "$"
end

TipoUsuario.seed(:id) do |s|
  s.nombre = "Empresa"
  s.es_admin = false
end

TipoUsuario.seed(:id) do |s|
  s.nombre = "Candidato"
  s.es_admin = false
end

TipoUsuario.seed(:id) do |s|
  s.id = 3
  s.nombre = "Admin"
  s.es_admin = true
end

Usuario.seed(:id) do |s|
  s.correo = "rbaezam@gmail.com"
  s.password = "admin"
  s.nombre = "Rodolfo"
  s.apellido = "Baeza"
  s.ciudad_id = 1
  s.tipo_usuario_id = 3
end

AntiguedadAnuncio.seed(:id) do |s|
  s.nombre = "Hoy"
  s.dias = 0
end

AntiguedadAnuncio.seed(:id) do |s|
  s.nombre = "7 días"
  s.dias = 7
end

AntiguedadAnuncio.seed(:id) do |s|
  s.nombre = "14 días"
  s.dias = 14
end

AntiguedadAnuncio.seed(:id) do |s|
  s.nombre = "30 días"
  s.dias = 30
end

AntiguedadAnuncio.seed(:id) do |s|
  s.nombre = "60 días"
  s.dias = 60
end
