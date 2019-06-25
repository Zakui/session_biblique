class PrintFiche < ActiveRecord::Migration[5.2]
  def change
    create_table :print_fiches do |t|
      t.string :filtre
      t.string :opt
      t.string :hash_id, index: true

      t.timestamps
    end
  end
end
