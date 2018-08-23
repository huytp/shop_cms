json.extract! photo_product, :id, :image, :created_at, :updated_at
json.url photo_product_url(photo_product, format: :json)
