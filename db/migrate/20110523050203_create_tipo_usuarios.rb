class CreateTipoUsuarios < ActiveRecord::Migration
  def change
    create_table :tipo_usuarios do |t|
      t.string :nombre
      t.boolean :es_admin

      t.timestamps
    end
  end
end
