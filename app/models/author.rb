class Author < ApplicationRecord
    has_one_attached  :author_image
 
    validates :name, :email, :phone, :address, :author_image, presence: true
end
