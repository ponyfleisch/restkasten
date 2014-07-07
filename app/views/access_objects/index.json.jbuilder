json.array!(@access_objects) do |access_object|
  json.extract! access_object, :id, :name
  json.url access_object_url(access_object)
end
