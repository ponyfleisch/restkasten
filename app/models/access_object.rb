class AccessObject < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :users
  has_many :accesses
end
