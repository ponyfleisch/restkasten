json.array!(@accesses) do |access|
  json.extract! access, :id, :created_at, :success, :onoff
  json.access_object_name access.access_object.name
  json.access_object_id access.access_object.id
  json.url user_access_url(@user, access)
end
