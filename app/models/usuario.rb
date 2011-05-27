class Usuario < ActiveRecord::Base

  has_secure_password

  attr_accessible :correo, :nombre, :apellido, :password, :password_confirmation, :tipo_usuario_id

  belongs_to :tipo_usuario
  belongs_to :ciudad
  has_many :empresas

  validates_presence_of :nombre
  validates_presence_of :correo
  validates_uniqueness_of :correo

  def nombre_completo
  	return "#{nombre} #{apellido}"
  end

end
