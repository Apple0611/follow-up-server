json.array!(@treatments) do |treatment|
  json.extract! treatment, :id
  json.url treatment_url(treatment, format: :json)
end
