json.array!(@purchases) do |purchase|
  json.extract! purchase, :id
  json.url user_purchase_url(@user, purchase)
end
