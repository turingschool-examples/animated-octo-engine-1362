class Studio < ApplicationRecord
  has_many :movies

  validates :name, presence: true
  validates :location, presence: true
end
