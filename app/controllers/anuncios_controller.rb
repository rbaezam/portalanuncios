class AnunciosController < ApplicationController
  respond_to :html, :xml, :json

  before_filter :autenticar, :except => [:index, :show]
  before_filter :llenar_catalogos, :only => [:new, :create, :edit]

  @@resultados_por_pagina = 5

  def index
    pagina = params[:pagina]

    texto = params[:texto]
    localidad = params[:localidad]
    estado_id = params[:estado_id]

    sueldo_minimo = params[:sueldo_minimo]
    periodicidad_id = params[:periodicidad_id]
    antiguedad_id = params[:antiguedad_id]
    empresa_id = params[:empresa_id]

    # Obtener los tipos de trabajo seleccionados
    @tipos_trabajos_seleccionados = []
    if not params[:tipos_trabajos_id].nil?
      tipos_sels = params[:tipos_trabajos_id]

      # Si hay varios elementos anexarlos uno por uno
      if tipos_sels.kind_of?(Array)
        tipos_sels.each do |ts|
          @tipos_trabajos_seleccionados << ts
        end
      else
        # De lo contrario anexar el único elemento
        @tipos_trabajos_seleccionados << tipos_sels
      end
    end
    
    # Obtener las categorías seleccionadas
    @categorias_seleccionadas = []
    if not params[:categoria_id].nil?
      cats_sels = params[:categoria_id]

      # Si hay varios elementos anexarlos uno por uno
      if cats_sels.kind_of?(Array)
        cats_sels.each do |cs|
          @categorias_seleccionadas << cs
        end
      else
        # De lo contrario anexar el único elemento
        @categorias_seleccionadas << cats_sels
      end
    end

    # Llenar los catálogos a mostrar
    @categorias = Categoria.all
    @periodicidades = PeriodicidadSueldo.all
    @antiguedades = AntiguedadAnuncio.all
    @tipos_trabajos = TipoTrabajo.all

    # Configurar los valores para los campos de búsqueda
    @texto = texto
    @localidad_nombre = Estado.find(estado_id).nombre unless estado_id.nil?
    @sueldo_minimo = params[:sueldo_minimo]
    
    if (texto.nil? or texto.empty?) and (localidad.nil? or localidad.empty?) \
      and (@categorias_seleccionadas.nil?) and (estado_id.nil?) and (@tipos_trabajos_seleccionados.nil?)
      @mostrando_todos = true
    else
      @mostrando_todos = false
    end

    @anuncios, @total_resultados = Anuncio.buscar_por_criterios(texto, localidad, estado_id, @categorias_seleccionadas,
                                             @tipos_trabajos_seleccionados, sueldo_minimo, periodicidad_id, antiguedad_id,
                                             empresa_id, pagina, @@resultados_por_pagina)

    # Valores para la navegación
    #@total_resultados = @anuncios.count
    @num_paginas = @total_resultados / @@resultados_por_pagina
    if (@total_resultados % @@resultados_por_pagina) > 0
      @num_paginas = @num_paginas + 1
    end

    @query_string = params[:query]
  end

  def show
    @anuncio = Anuncio.find(params[:id])
    respond_with @anuncio
  end

  def new
    @anuncio = Anuncio.new
  end

  def create
    @anuncio = Anuncio.new(params[:anuncio])

    @anuncio.ciudad = Ciudad.find(params[:anuncio_ciudad_id])
    @anuncio.subcategoria = Subcategoria.find(params[:anuncio_subcategoria_id])
    @anuncio.empresa = Empresa.find(params[:anuncio_empresa_id])
    @anuncio.usuario = usuario_actual

    if @anuncio.save

      tipos_trabajos = params[:anuncio_tipo_trabajo_id]
      tipos_trabajos.each do |tipo_id|
        tipo = TipoTrabajo.find(tipo_id)
        tipo_trabajo_anuncio = TipoTrabajoAnuncio.new(:anuncio => @anuncio, :tipo_trabajo => tipo)
        tipo_trabajo_anuncio.save
      end

      flash[:notice] = "Anuncio publicado correctamente"
      redirect_to portal_empresas_path
    else
      render :action => :new
    end
  end

  def edit
    @anuncio = Anuncio.find(params[:id])
    @anuncio_id = @anuncio.ciudad.estado_id

    @ciudades = Ciudad.where(:estado_id => @anuncio.ciudad.estado_id)
    @subcategorias = Subcategoria.where(:categoria_id => @anuncio.subcategoria.categoria_id)
  end

  def update
  end

  def destroy
  end

  private
  def llenar_catalogos
    @empresas = Empresa.por_usuario(usuario_actual)

    if @empresas.count == 0
      redirect_to new_empresa_path, :notice => "Antes de publicar un anuncio debe agregar al menos una empresa."
    end

    @estados = Estado.order(:nombre)
    @categorias = Categoria.order(:nombre)
    @tipos_trabajos = TipoTrabajo.all
    @monedas = Moneda.all
    @periodicidades = PeriodicidadSueldo.all
  end
  
end
