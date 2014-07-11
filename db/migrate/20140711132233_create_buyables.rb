class CreateBuyables < ActiveRecord::Migration
  def change
    create_table :buyables do |t|
      t.integer :price
      t.string :name

      t.timestamps
    end
  end
end
