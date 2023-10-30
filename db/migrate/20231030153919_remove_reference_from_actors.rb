class RemoveReferenceFromActors < ActiveRecord::Migration[7.0]
  def change
    remove_reference :actors, :movies, null: false, foreign_key: true
  end
end
