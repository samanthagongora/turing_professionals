class Technology < ApplicationRecord
  validates_presence_of :name
  has_many :user_technologies

  def self.most_popular
    # Technology.select("technologies.*")
    # .joins(user_technologies: :user)
    # .group(:id)
    # .order("count(users) DESC")
    # .limit(10)
    Technology.find_by_sql "SELECT technologies.*,
    SUM(case when users.cohort LIKE '1705 FE' then 1 else 0 end)
    AS front_end_users
    FROM technologies
    INNER JOIN user_technologies
    ON technologies.id = user_technologies.technology_id
    INNER JOIN users ON user_technologies.user_id = users.id
    GROUP BY technologies.id
    ORDER BY COUNT(users) DESC
    LIMIT 10"
  end
end
