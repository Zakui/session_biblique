class CreateSessionistes < ActiveRecord::Migration[5.2]
  def change
    create_table :sessionistes do |t|
      t.string :prenoms
      t.string :nom
      t.string :sexe
      t.integer :nombre_participation, default: 0
      t.integer :age
      t.string :derniere_classe, null: true
      t.string :telephone, null: true
      t.string :classe, null: true
      t.references :chambre, foreign_key: true
      t.references :paroise, foreign_key: true

      t.timestamps
    end
  end
end
