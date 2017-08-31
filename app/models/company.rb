class Company < ApplicationRecord
  validates_presence_of :name, :website
end
