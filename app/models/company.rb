class Company < ApplicationRecord
  validates_presence_of :name, :website

  has_many :company_industries
  has_many :industries, through: :company_industries
  has_many :office_locations
  has_many :locations, through: :office_locations
  has_many :workplaces
  has_many :employed_users, class_name: "User", through: :workplaces
  has_many :favorites, as: :favoritable
  # returns the user objects
  has_many :favorited_by, through: :favorites, source: :user
  has_many :tech_stacks
  has_many :technologies, through: :tech_stacks
  has_many :contacts
  has_many :interview_questions

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize if name
  end

  def self.questions(user_companies)
    user_companies.map {|c| c.interview_questions}
  end

  def self.filter(params)
    Company.select("companies.*")
          .joins(office_locations: :location)
          .joins(company_industries: :industry)
          .where("locations.id": params[:location_ids])
          .where("industries.id": params[:industry_ids]).distinct
  end
end
