class PeriodicidadSueldo < ActiveRecord::Base
  default_scope order(:num_horas)
end
