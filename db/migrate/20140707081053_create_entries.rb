class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :door

      t.timestamps
    end
  end
end
