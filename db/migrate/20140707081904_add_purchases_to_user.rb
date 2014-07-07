class AddPurchasesToUser < ActiveRecord::Migration
  def change
    add_belongs_to :purchases, :user
  end
end
