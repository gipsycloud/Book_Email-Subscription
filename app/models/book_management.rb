class BookManagement < ApplicationRecord
  has_one_attached  :cover_photo
  
  belongs_to :author
  belongs_to :category
end
