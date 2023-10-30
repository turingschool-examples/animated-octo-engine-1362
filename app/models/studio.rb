class Studio < ApplicationRecord
  has_many :movies

  def studio_actors
    Movie.joins(:actors).where("movies.studio_id = #{self.id}")
  end
end
