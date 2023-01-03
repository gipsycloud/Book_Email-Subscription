class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  def author(user)
    self.projects_users.where(user: :user)
  end
end
