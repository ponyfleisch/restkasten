class AddEntriesToUser < ActiveRecord::Migration
  def change
    add_belongs_to :entries, :user
  end
end
