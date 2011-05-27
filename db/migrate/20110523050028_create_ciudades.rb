class CreateCiudades < ActiveRecord::Migration
  def change
    create_table :ciudades do |t|
      t.string :nombre
      t.references :estado

      t.timestamps
    end
  end
end
