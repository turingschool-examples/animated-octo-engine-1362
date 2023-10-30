class Studio < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  has_many :movies
end
