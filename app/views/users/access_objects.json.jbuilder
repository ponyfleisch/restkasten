json.array!(@access_objects) do |access_object|
  json.extract! access_object, :id, :name
  json.url user_user_access_object_url(@user, access_object)
end
