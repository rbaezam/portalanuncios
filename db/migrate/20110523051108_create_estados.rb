class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nombre
      t.references :pais

      t.timestamps
    end
    add_index :estados, :pais_id
  end
end
