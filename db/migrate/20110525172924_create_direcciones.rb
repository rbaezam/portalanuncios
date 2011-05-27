class CreateDirecciones < ActiveRecord::Migration
  def change
    create_table :direcciones do |t|
      t.references :empresa
      t.string :calle
      t.string :numero_interior
      t.string :numero_exterior
      t.string :colonia
      t.string :codigo_postal
      t.string :municipio
      t.boolean :es_facturacion
      t.references :ciudad

      t.timestamps
    end
    add_index :direcciones, :empresa_id
    add_index :direcciones, :ciudad_id
  end
end
