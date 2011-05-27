class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :rfc
      t.string :descripcion
      t.references :industria
      t.string :telefono
      t.string :fax
      t.references :usuario
      t.string :pagina_web
      t.string :url_logo

      t.timestamps
    end
    add_index :empresas, :industria_id
    add_index :empresas, :usuario_id
  end
end
