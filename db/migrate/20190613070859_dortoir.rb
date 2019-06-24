class Dortoir < ActiveRecord::Migration[5.2]
  def change
    create_table :dortoirs do |t|
      t.string :nom, null: true
      t.string :abbreger, null: true
      t.integer :capacite, default: 0
      t.integer :place_disponible, default: 0
      t.references :batiment, foreign_key: true
      t.string :ocupant

      t.timestamps
    end
  end
end
