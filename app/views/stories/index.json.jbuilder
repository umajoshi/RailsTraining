json.array!(@stories) do |story|
  json.extract! story, :id, :url, :title, :author, :user_id, :description, :published_on
  json.url story_url(story, format: :json)
end
