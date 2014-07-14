json.extract! @access, :id, :created_at, :updated_at, :success, :onoff
json.access_object_name @access.access_object.name
json.user_name @user.name
json.access_object user_user_access_object_url(@user, @access.access_object_id)
