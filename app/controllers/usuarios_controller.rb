#encoding:utf-8
class UsuariosController < ApplicationController
  before_filter :llenar_catalogos, :only => [:new, :create, :edit, :update]
  before_filter :autenticar, :except => [:new, :create]
  before_filter :comprobar_usuario_actual, :only => [:edit, :update, :cambiar_password, :realizar_cambio_password]

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      redirect_to root_path
    else
      flash.now[:error] = "Ocurrió un error al registrar el usuario"
      render :new
    end
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(params[:usuario])
      if es_empresa?
        redirect_to portal_empresas_path
      else
        redirect_to portal_candidatos_path
      end
    else
      flash.now[:error] = "Ocurrió un error al modificar los datos del usuario"
      render :edit
    end
  end

  def destroy
  end

  def cambiar_password
  end

  def realizar_cambio_password

    if params[:password] != params[:password2]
      flash.now[:error] = "Las contraseñas no coinciden"
      render :cambiar_password and return
    end

    if @usuario.try(:authenticate, params[:password_actual]) == false
      flash.now[:error] = "La contraseña actual es incorrecta"
      render :cambiar_password and return
    end

    @usuario.password = params[:password]
    if @usuario.save
      flash.now[:notice] = "La contraseña fue modificada correctamente"
    else
      flash.now[:error] = "Ocurrió un error al intentar cambiar la contraseña"
      render :cambiar_password and return
    end
  end

  def usuario_incorrecto
  end

  private

  def comprobar_usuario_actual
    @usuario = Usuario.find(params[:id])
    if @usuario.id != usuario_actual.id
      redirect_to usuario_incorrecto_path
    end
  end

  def llenar_catalogos
    @tipos_usuario = TipoUsuario.where(:es_admin=>false)
  end

end
