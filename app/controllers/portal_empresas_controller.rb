class PortalEmpresasController < ApplicationController
  before_filter :autenticar

  def index
    @usuario = usuario_actual
    @empresas = Empresa.por_usuario(usuario_actual)
    @anuncios = Anuncio.por_usuario(usuario_actual)
  end

end
