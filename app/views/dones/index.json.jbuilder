json.array!(@dones) do |done|
  json.extract! done, :id, :content, :user_id
  json.url done_url(done, format: :json)
end
