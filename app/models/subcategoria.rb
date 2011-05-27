class Subcategoria < ActiveRecord::Base
  default_scope order(:nombre)

  belongs_to :categoria
end
