class Post < ApplicationRecord
  validates :name, presence: true
  validates :description, length: {maximum: 140}
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end
