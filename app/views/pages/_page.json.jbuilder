json.extract! page, :id, :title, :slug, :meta_title, :meta_keyword, :meta_description, :content, :image, :created_at, :updated_at
json.url page_url(page, format: :json)
