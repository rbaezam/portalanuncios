class Anuncio < ActiveRecord::Base

  has_many :tipos_trabajos_anuncio, :class_name => 'TipoTrabajoAnuncio'

  belongs_to :empresa
  belongs_to :ciudad
  belongs_to :subcategoria
  belongs_to :periodicidad_sueldo
  belongs_to :moneda
  belongs_to :usuario
  belongs_to :nivel_anuncio

  validates :titulo, :presence => true

  ANUNCIOS_DESTACADOS = 5

  def self.buscar_por_criterios(texto, localidad, estado_id, categorias, tipos_trabajos, sueldo_minimo, 
    periodicidad_id, antiguedad_id, empresa_id, numero_pagina, resultados_por_pagina)
    
    primera = true
    condicion = ""
    
    if not categorias.empty?
      condicion = condicion << "categorias.id in ("
      separador = ""
      categorias.each do |c|
        condicion = condicion << separador
        condicion = condicion << c
        separador = ","
      end
      condicion = condicion << ") "
      primera = false
    end

    if not tipos_trabajos.empty?
      if primera == false
        condicion = condicion << " and "
      end
      condicion = condicion << "tipos_trabajos.id in ("
      separador = ""
      tipos_trabajos.each do |tt|
        condicion = condicion << separador
        condicion = condicion << tt
        separador = ","
      end
      condicion = condicion << ") "
      primera = false
    end
    
    if not estado_id.nil?
      if primera == false
        condicion = condicion << "estados.id = %d" % estado_id
      else
        primera = false
        condicion = condicion << " and estados.id = %d" % estado_id
      end
    end

    if not empresa_id.nil?
      if primera == false
        condicion = condicion << " and "
      else
        primera = false
      end
      condicion = condicion << " empresa_id = %d" % empresa_id
    end

    if not texto.nil? and not texto.empty?
      if primera == false
        condicion = condicion << "and "
      else
        primera = false
      end
      condicion = "descripcion like '%%%s%%' or titulo like '%%%s%%'" % [texto, texto]
    end
    
    if not localidad.nil? and not localidad.empty?
      if primera == false
        condicion = condicion << " and "
      else
        primera = false
      end
      condicion = condicion << "ciudades.nombre like '%%%s%%' or estados.nombre like '%%%s%%'" % [localidad, localidad]
    end

    if not antiguedad_id.blank?
      if primera == false
        condicion = condicion << " and "
      else
        primera = false
      end
      antiguedad = AntiguedadAnuncio.find(antiguedad_id)
      num_dias = antiguedad.dias
      condicion = condicion << "anuncios.created_at >= '%s' " % num_dias.days.ago;
    end

    if not sueldo_minimo.blank?
      if primera == false
        condicion = condicion << " and "
      else
        primera = false
      end
      periodicidad = PeriodicidadSueldo.find(periodicidad_id)
      condicion = condicion << "((periodicidades_sueldo.num_horas/%d)*%s)<=sueldo_minimo" % [periodicidad.num_horas, sueldo_minimo.to_s]
    end

    if not condicion.nil? and not condicion.empty?
      anuncios = Anuncio.joins(:ciudad => :estado).joins(:subcategoria => :categoria).
          joins(:tipos_trabajos_anuncio => :tipo_trabajo).joins(:periodicidad_sueldo).where(condicion).
          paginate(:page => numero_pagina, :per_page => resultados_por_pagina)
          group('anuncios.id,titulo,anuncios.descripcion,anuncios.empresa_id,anuncios.ciudad_id, ' + \
            'anuncios.subcategoria_id,anuncios.periodicidad_sueldo_id,anuncios.sueldo_minimo,anuncios.sueldo_maximo, ' + \
            'anuncios.moneda_id,anuncios.puesto,anuncios.referencia,anuncios.usuario_id,anuncios.nivel_anuncio_id,anuncios.activo,' + \
            'anuncios.created_at,anuncios.updated_at').order("created_at desc").all

      total_resultados = Anuncio.joins(:ciudad => :estado).joins(:subcategoria => :categoria).joins(:periodicidad_sueldo).
          joins(:tipos_trabajos_anuncio => :tipo_trabajo).where(condicion).count
    else
      anuncios = Anuncio.order("created_at desc").paginate(:page => numero_pagina, :per_page => resultados_por_pagina)
      #anuncios = Anuncio.order("created_at desc")
      
      total_resultados = Anuncio.all.count
    end
    return anuncios, total_resultados
  end

  def self.buscar_destacados
    anuncios = Anuncio.order("created_at desc").limit(ANUNCIOS_DESTACADOS)
    return anuncios
  end

  def self.por_usuario(usuario)
    where("usuario_id = ?", usuario.id) unless usuario.nil?
  end
end
