json.extract! post, :id, :title, :slug, :category_ids, :content, :meta_keyword, :meta_title, :meta_description, :image, :created_at, :updated_at
json.url post_url(post, format: :json)
