json.array!(@disease_categories) do |disease_category|
  json.extract! disease_category, :id, :name, :description, :parent, :level, :is_active, :is_empty, :is_bottom
  json.url disease_category_url(disease_category, format: :json)
end
