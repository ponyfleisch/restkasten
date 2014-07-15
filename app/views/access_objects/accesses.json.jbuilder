json.array!(@access_object.accesses) do |access|
  json.extract! access, :id, :created_at, :onoff, :success, :user_id
  json.username access.user.name
  json.user_url user_url(access.user)
end
