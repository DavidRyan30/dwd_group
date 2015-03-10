json.array!(@users) do |user|
  json.extract! user, :id, :f_name, :s_name, :email, :password
  json.url user_url(user, format: :json)
end
