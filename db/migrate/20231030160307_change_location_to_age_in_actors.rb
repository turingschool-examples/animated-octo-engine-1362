class ChangeLocationToAgeInActors < ActiveRecord::Migration[7.0]
  def change
    rename_column :actors, :location, :age

  end
end
