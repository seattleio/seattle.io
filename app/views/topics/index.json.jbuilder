json.array!(@topics) do |topic|
  json.extract! topic, :id, :name, :description, :geometry
  json.url topic_url(topic, format: :json)
end
