class CreateNivelesAnuncio < ActiveRecord::Migration
  def change
    create_table :niveles_anuncio do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
