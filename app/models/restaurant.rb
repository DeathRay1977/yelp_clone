class Restaurant < ActiveRecord::Base
  validates :name, length: { minimum: 3 }, uniqueness: true
  has_many :reviews, dependent: :destroy
  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating).to_i
  end
end
