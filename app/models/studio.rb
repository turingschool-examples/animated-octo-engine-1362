class Studio < ApplicationRecord
  has_many :movies
  has_many :actors, through: :movies

  validates :name, presence: true
  validates :location, presence: true


  def actors_all
    self.actors.select("actors.*").distinct
  end
end
