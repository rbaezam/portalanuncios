class Direccion < ActiveRecord::Base
  belongs_to :empresa
  belongs_to :ciudad

  after_initialize :inicializar

  def inicializar
    self.es_facturacion ||= false
  end
end
