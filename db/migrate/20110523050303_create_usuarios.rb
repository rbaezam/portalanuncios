class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :correo
      t.string :password_digest
      t.string :nombre
      t.string :apellido
      t.references :ciudad
      t.references :tipo_usuario

      t.timestamps
    end
  end
end
