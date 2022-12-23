class Category < ApplicationRecord
    validates :category_name, presence: true
    validates_uniqueness_of :category_name, :message => "already exists"
end
