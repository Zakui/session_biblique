class Batiment < ActiveRecord::Migration[5.2]
  def change
    create_table :batiments do |t|
      t.string :nom
      t.string :abbreger

      t.timestamps
    end
  end
end
