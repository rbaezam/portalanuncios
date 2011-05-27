class CreateAntiguedadesAnuncio < ActiveRecord::Migration
  def change
    create_table :antiguedades_anuncio do |t|
      t.string :nombre
      t.integer :dias

      t.timestamps
    end
  end
end
