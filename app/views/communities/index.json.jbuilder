json.array!(@communities) do |community|
  json.extract! community, :id, :name, :description, :geometry, :published, :slug
  json.url community_url(community, format: :json)
end
