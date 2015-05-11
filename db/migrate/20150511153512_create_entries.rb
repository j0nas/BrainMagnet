class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :date
      t.integer :mood
      t.decimal :sleep
      t.integer :irritability
      t.integer :anxiety
      t.boolean :psychotic
      t.string :notes


      t.timestamps null: false
    end
  end
end
