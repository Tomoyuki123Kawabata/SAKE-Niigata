class PostSake < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_one_attached :image

  validates :sake, presence: true
  validates :comment, presence: true
  validates :image, presence: true
end
