class Movie < ApplicationRecord
  belongs_to :studio
  has_and_belongs_to_many :actors
  
  def add_actor(actor_id)
    actor = Actor.find(actor_id)
    self.actors << actor unless self.actors.include?(actor)
  end
end
