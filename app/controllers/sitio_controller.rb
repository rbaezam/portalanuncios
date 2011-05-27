class SitioController < ApplicationController
  def index
    @destacados = Anuncio.buscar_destacados
    @categorias = Categoria.all
    @estados = Estado.all
    @empresas = Empresa.all
  end

end
