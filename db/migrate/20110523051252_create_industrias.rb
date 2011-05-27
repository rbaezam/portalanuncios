class CreateIndustrias < ActiveRecord::Migration
  def change
    create_table :industrias do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
