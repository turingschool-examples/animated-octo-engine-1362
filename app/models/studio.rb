class Studio < ApplicationRecord
  has_many :movies
  has_many :actors, through: :movies

  def actors_all
    self.actors.select("actors.*").distinct
  end
end
