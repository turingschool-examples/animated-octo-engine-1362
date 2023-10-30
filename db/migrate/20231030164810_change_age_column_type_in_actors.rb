class ChangeAgeColumnTypeInActors < ActiveRecord::Migration[7.0]
  def change
    change_column :actors, :age, :integer, using: 'age::integer'
  end
end
