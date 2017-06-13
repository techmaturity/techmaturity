class AddIsAssessableFlagToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :is_assessable, :boolean, default: true
  end
end
