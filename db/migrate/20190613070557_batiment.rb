class Batiment < ActiveRecord::Migration[5.2]
  def change
    create_table :batiments do |t|
      t.string :nom
      t.string :abbreger
      t.string :hash_id, index: true

      t.timestamps
    end
  end
end
