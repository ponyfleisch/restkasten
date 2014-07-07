json.array!(@accesses) do |access|
  json.extract! access, :id, :created_at
  json.access_object_name access.access_object.name
  json.url user_access_url(@user, access)
end
