class Access < ActiveRecord::Base
  belongs_to :user
  belongs_to :access_object
end
