class CreateAnuncios < ActiveRecord::Migration
  def change
    create_table :anuncios do |t|
      t.string :titulo
      t.text :descripcion
      t.references :empresa
      t.references :ciudad
      t.references :subcategoria
      t.references :periodicidad_sueldo
      t.float :sueldo_minimo
      t.float :sueldo_maximo
      t.references :moneda
      t.string :puesto
      t.string :referencia
      t.references :usuario
      t.references :nivel_anuncio
      t.boolean :activo

      t.timestamps
    end
    add_index :anuncios, :empresa_id
    add_index :anuncios, :ciudad_id
    add_index :anuncios, :subcategoria_id
    add_index :anuncios, :periodicidad_sueldo_id
    add_index :anuncios, :moneda_id
    add_index :anuncios, :usuario_id
    add_index :anuncios, :nivel_anuncio_id
  end
end
