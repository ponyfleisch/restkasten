class CreateAccessObjects < ActiveRecord::Migration
  def change
    create_table :access_objects do |t|
      t.string :name
      t.timestamps
    end

    create_table :access_objects_users, id: false do |t|
      t.belongs_to :access_object
      t.belongs_to :user
    end
  end
end
