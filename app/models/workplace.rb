class Workplace < ApplicationRecord
  belongs_to :employed_user, class_name: "User", foreign_key: :user_id
  belongs_to :company

  validates_presence_of :user_id, :company_id, :position, :status
  enum status: [:current, :previous]

  def self.title_counts
      select("position AS title, count(workplaces) AS count")
      .where(status: "current")
      .group("position")
      .order("count DESC")
  end
end
