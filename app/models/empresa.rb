class Empresa < ActiveRecord::Base
  default_scope order(:nombre)

  belongs_to :ciudad
  belongs_to :industria
  belongs_to :usuario

  has_many :anuncios
  has_many :direcciones

  validate :nombre, :presence => true
  validate :ciudad, :presence => true
  validate :usuario, :presence => true

  def self.por_usuario(usuario)
    where("usuario_id = ?", usuario.id) unless usuario.nil?
  end
end
