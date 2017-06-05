class AddIsActiveFlagToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :is_active, :boolean, default: true
  end
end
