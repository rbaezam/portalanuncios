class Estado < ActiveRecord::Base
  default_scope order(:nombre)

  belongs_to :pais
end
