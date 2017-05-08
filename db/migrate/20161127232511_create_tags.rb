class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :key
      t.string :value
      t.integer :product_id

      t.timestamps
    end
  end
end
