class RemoveReferenceFromMovieActors < ActiveRecord::Migration[7.0]
  def change
    remove_reference :movie_actors, :movies, null: false, foreign_key: true
    remove_reference :movie_actors, :actors, null: false, foreign_key: true
    add_reference :movie_actors, :movie, null: false, foreign_key: true
    add_reference :movie_actors, :actor, null: false, foreign_key: true
  end
end
