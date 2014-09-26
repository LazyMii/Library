json.array!(@requests) do |request|
  json.extract! request, :id, :isbn, :title, :publisher, :text, :name
  json.url request_url(request, format: :json)
end
