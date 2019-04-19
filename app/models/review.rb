class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :rating, :description, presence: true
end
