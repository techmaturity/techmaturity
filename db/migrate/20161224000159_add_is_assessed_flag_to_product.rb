class AddIsAssessedFlagToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :isAssessed, :boolean
  end
end
