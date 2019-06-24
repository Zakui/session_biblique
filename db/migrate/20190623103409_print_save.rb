class PrintSave < ActiveRecord::Migration[5.2]
  def change
    create_table :print_saves do |t|
      t.text :ids

      t.timestamps
    end
  end
end
