class CreateTiposTrabajosAnuncio < ActiveRecord::Migration
  def change
    create_table :tipos_trabajos_anuncio do |t|
      t.references :anuncio
      t.references :tipo_trabajo

      t.timestamps
    end
    add_index :tipos_trabajos_anuncio, :anuncio_id
    add_index :tipos_trabajos_anuncio, :tipo_trabajo_id
  end
end
