json.extract! @access, :id, :created_at, :updated_at
json.access_object user_user_access_object_url(@user, @access.access_object_id)