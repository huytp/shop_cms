json.extract! product, :id, :name, :slug, :meta_title, :meta_keyword, :meta_description, :old_price, :new_price, :sku, :image, :property, :created_at, :updated_at
json.url product_url(product, format: :json)
