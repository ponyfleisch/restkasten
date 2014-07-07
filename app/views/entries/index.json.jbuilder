json.array!(@entries) do |entry|
  json.extract! entry, :id
  json.url user_entry_url(@user, entry)
end
