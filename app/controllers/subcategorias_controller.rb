class SubcategoriasController < ApplicationController

  def obtener_por_categoria()
    categoria_id=params[:categoria_id]
    @subcategorias = Subcategoria.find_all_by_categoria_id(categoria_id)
    respond_to do |format|
      format.json { render :text => @subcategorias.to_json(:only => [:id, :nombre]) }
    end
  end

end
