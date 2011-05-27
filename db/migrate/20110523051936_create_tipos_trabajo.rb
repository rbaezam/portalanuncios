class CreateTiposTrabajo < ActiveRecord::Migration
  def change
    create_table :tipos_trabajo do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
