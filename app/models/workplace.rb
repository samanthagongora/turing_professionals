class Workplace < ApplicationRecord
  belongs_to :employed_user, class_name: "User", foreign_key: :user_id
  belongs_to :company

  validates_presence_of :user_id, :company_id, :position, :status
end
