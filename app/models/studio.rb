class Studio < ApplicationRecord
  has_many :movies
  has_many :actors, through: :movies

  def actor_list
    actors.distinct.pluck(:name)
  end
end
