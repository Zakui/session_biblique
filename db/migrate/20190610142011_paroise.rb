class Paroise < ActiveRecord::Migration[5.2]
  def change
    create_table :paroises do |t|
      t.string :nom
      t.string :hash_id, index: true

      t.timestamps
    end
  end
end
