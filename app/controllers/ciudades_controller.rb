class CiudadesController < ApplicationController

  def obtener_por_estado()
    estado_id=params[:estado_id]
    @ciudades = Ciudad.find_all_by_estado_id(estado_id)
    respond_to do |format|
      format.json { render :text => @ciudades.to_json(:only => [:id, :nombre]) }
    end
  end
end
