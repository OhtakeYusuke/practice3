class Post < ApplicationRecord
  validates :name, presence: true
  validates :description, length: {maximum: 140}
  has_secure_password
  belongs_to :user
end
