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
      t.string :groupe, null: true
      t.string :communaute, null: true
      t.references :dortoir, foreign_key: true
      t.references :paroise, foreign_key: true
      t.string :hash_id, index: true

      t.timestamps
    end
  end
end
