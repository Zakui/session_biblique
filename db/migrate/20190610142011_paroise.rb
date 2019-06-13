class Paroise < ActiveRecord::Migration[5.2]
  def change
    create_table :paroises do |t|
      t.string :nom

      t.timestamps
    end
  end
end
