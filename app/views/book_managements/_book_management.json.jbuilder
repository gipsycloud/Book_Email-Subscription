json.extract! book_management, :id, :title, :description, :author_id, :category_id, :created_at, :updated_at
json.url book_management_url(book_management, format: :json)
