#encoding:utf-8
class EmpresasController < ApplicationController
  before_filter :llenar_catalogos, :only => [:new, :create, :edit, :update]

  def index
  end

  def show
  end

  def new
    @empresa = Empresa.new
  end

  def create
    @empresa = Empresa.new(params[:empresa])
    @empresa.usuario_id = usuario_actual.id unless usuario_actual.nil?

    if @empresa.save

      direccion = Direccion.create(:ciudad_id => params[:ciudad_id], :municipio => params[:municipio], :calle => params[:calle], 
          :numero_interior => params[:numero_interior], :numero_exterior => params[:numero_exterior], :colonia => params[:colonia],
          :codigo_postal => params[:codigo_postal], :empresa => @empresa)

      redirect_to portal_empresas_path, :notice => "Empresa agregada correctamente"
    else
      flash.now.alert = "Ocurrió un error al agregar la empresa"
      render :new
    end
  end

  def edit
    @empresa = Empresa.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def llenar_catalogos
    @industrias = Industria.all
    @estados = Estado.all
  end

  

end
