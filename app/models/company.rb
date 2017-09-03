class Company < ApplicationRecord
  validates_presence_of :name, :website

  has_many :company_industries
  has_many :industries, through: :company_industries
  has_many :office_locations
  has_many :locations, through: :office_locations
  has_many :workplaces
  has_many :employed_users, class_name: "User", through: :workplaces
  has_many :tech_stacks
  has_many :technologies, through: :tech_stacks
  has_many :contacts
  has_many :interview_questions

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize if name
  end
end
