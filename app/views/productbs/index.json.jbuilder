json.array!(@productbs) do |productb|
  json.extract! productb, :id, :title, :string, :description, :image_url, :price
  json.url productb_url(productb, format: :json)
end
