class RenameRatingToPlay < ActiveRecord::Migration[5.1]
  def change
    rename_table :ratings, :plays
    rename_column :plays, :value, :rating
    add_column :plays, :number_of_players, :string
  end
end
