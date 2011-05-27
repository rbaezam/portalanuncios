#encoding: utf-8
class SesionesController < ApplicationController
  before_filter :usuario_conectado?, :except => [:new, :create, :destroy]

  def new
  end

  def create
    if params[:correo].empty?
      flash.now[:error] = "Debe proporcionar los datos de usuario"
      render :new and return
    end
    if usuario = Usuario.find_by_correo(params[:correo]).try(:authenticate, params[:password])
      session[:usuario_id] = usuario.id
      redirect_to root_path
    else
      flash.now[:error] = "Datos de inicio de sesión incorrectos"
      render :new
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_url
  end

end
