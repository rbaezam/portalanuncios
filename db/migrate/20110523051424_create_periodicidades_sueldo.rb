class CreatePeriodicidadesSueldo < ActiveRecord::Migration
  def change
    create_table :periodicidades_sueldo do |t|
      t.string :nombre
      t.integer :num_horas

      t.timestamps
    end
  end
end
