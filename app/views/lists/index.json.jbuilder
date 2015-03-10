json.array!(@lists) do |list|
  json.extract! list, :id, :user, :date, :note
  json.url list_url(list, format: :json)
end
