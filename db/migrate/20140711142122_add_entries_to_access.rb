class AddEntriesToAccess < ActiveRecord::Migration
  def change
    change_table :accesses do |t|
      t.boolean :onoff 
      t.boolean :success
    end
  end
end
