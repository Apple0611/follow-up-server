json.array!(@diseases) do |disease|
  json.extract! disease, :id, :name, :summary, :overview
  json.url disease_url(disease, format: :json)
end
