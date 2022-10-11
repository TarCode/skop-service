class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.integer :total_in_cents
      t.string :unit
      t.references :store, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
