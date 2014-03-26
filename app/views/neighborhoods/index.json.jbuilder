json.array!(@neighborhoods) do |neighborhood|
  json.extract! neighborhood, :id, :name, :description, :geometry
  json.url neighborhood_url(neighborhood, format: :json)
end
