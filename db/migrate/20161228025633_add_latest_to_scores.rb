class AddLatestToScores < ActiveRecord::Migration[5.0]
  def change
    add_column :scores, :latest, :Boolean
  end
end
