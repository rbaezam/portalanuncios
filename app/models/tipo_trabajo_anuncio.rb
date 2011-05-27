class TipoTrabajoAnuncio < ActiveRecord::Base
  belongs_to :anuncio
  belongs_to :tipo_trabajo
end
