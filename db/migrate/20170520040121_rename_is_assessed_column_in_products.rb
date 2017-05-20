class RenameIsAssessedColumnInProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :isAssessed, :is_assessed
  end
end
