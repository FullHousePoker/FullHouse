class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.float :lat
      t.float :lng
      t.integer :buy_in_amount
      t.integer :table_size
      t.text :players, array: true, default: []
      t.integer :host_id
      t.string :variation
      t.timestamps null: false
    end
  end
end
