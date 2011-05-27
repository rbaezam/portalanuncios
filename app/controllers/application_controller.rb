class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :usuario_actual, :usuario_conectado?, :usuario_desconectado?

  def usuario_actual
    if session[:usuario_id]
      @usuario_actual ||= Usuario.find(session[:usuario_id])
    end
    @usuario_actual
  end

  def usuario_conectado?
    !!usuario_actual
  end

  def usuario_desconectado?
    !usuario_conectado?
  end

  def es_empresa?
    if not usuario_actual.nil?
      return usuario_actual.tipo_usuario.nombre == 'Empresa'
    end
    return false
  end

  def es_candidato?
    if not usuario_actual.nil?
      return usuario_actual.tipo_usuario.nombre == 'Candidato'
    end
    return false
  end

  def autenticar
    if usuario_actual.nil?
      redirect_to iniciar_sesion_path
    end
  end
end
