json.array!(@posts) do |post|
  json.extract! post, :id, :trip_id, :site, :description
  json.url post_url(post, format: :json)
end
