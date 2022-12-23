class BookManagement < ApplicationRecord
  mount_uploader :pdf_attachment
  has_one_attached  :book_image

  belongs_to :author
  belongs_to :category

  validates :title, :description, :author_id, :category_id, presence: true
end
