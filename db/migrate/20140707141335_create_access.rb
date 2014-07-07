class CreateAccess < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.belongs_to :user
      t.belongs_to :access_object

      t.timestamps
    end
  end
end
