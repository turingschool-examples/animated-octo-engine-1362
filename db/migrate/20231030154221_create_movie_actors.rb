class CreateMovieActors < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_actors do |t|
      t.references :movies, null: false, foreign_key: true
      t.references :actors, null: false, foreign_key: true

      t.timestamps
    end
  end
end
