class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_sake
end
