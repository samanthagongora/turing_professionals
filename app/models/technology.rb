class Technology < ApplicationRecord
  validates_presence_of :name
  has_many :user_technologies
  has_many :tech_stacks
  has_many :companies, through: :tech_stacks
  has_many :industries, through: :companies

  def self.most_popular
    Technology.find_by_sql "SELECT technologies.*,
    SUM(case when users.program_type = 1 then 1 else 0 end)
    AS front_end_users,
    SUM(case when users.program_type = 0 then 1 else 0 end)
    AS back_end_users
    FROM technologies
    INNER JOIN user_technologies
    ON technologies.id = user_technologies.technology_id
    INNER JOIN users ON user_technologies.user_id = users.id
    GROUP BY technologies.id
    ORDER BY COUNT(users) DESC
    LIMIT 10"
  end

  def self.by_industry_and_company(query)
    results = self.includes(:industries)
    .where("industries.name = ?", query)
    .references(:industries)
    .joins(:companies)
    .group("technologies.name")
    .count(:companies)
    # new_results = []
    # results.each do |key, value|
    #   new_results << {name: key, companies_count: value}
    # end
    # new_results
  end
end
