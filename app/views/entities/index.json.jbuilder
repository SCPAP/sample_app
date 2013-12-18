json.array!(@entities) do |entity|
  json.extract! entity, :image, :latitude, :longitude, :mine_type, :filename
  json.url entity_url(entity, format: :json)
end