class Technology < ApplicationRecord
  validates_presence_of :name
  has_many :user_technologies

  def self.most_popular
    Technology.select("technologies.*")
    .joins(user_technologies: :user)
    .group(:id)
    .order("count(users) DESC")
    .limit(10)
  end
end
