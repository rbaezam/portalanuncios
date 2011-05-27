class Categoria < ActiveRecord::Base
  default_scope order(:nombre)
end
