class Industria < ActiveRecord::Base
  default_scope order(:nombre)
end
