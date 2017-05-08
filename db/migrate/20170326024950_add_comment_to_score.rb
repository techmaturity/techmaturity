class AddCommentToScore < ActiveRecord::Migration[5.0]
  def change
    add_column :scores, :comment, :text
  end
end
