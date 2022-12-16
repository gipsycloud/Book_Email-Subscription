class BookManagement < ApplicationRecord
  has_one_attached  :book_image

  belongs_to :author
  belongs_to :category

  validates :title, :description, :author_id, :category_id, :book_image, presence: true


end
