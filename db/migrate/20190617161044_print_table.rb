class PrintTable < ActiveRecord::Migration[5.2]
  def change
    create_table :print_tables do |t|
      t.string :titre
      t.text :ids

      t.timestamps
    end
  end
end
