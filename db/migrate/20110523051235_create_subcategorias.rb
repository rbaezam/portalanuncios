class CreateSubcategorias < ActiveRecord::Migration
  def change
    create_table :subcategorias do |t|
      t.string :nombre
      t.references :categoria

      t.timestamps
    end
    add_index :subcategorias, :categoria_id
  end
end
