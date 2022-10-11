class CreateSaleitems < ActiveRecord::Migration[7.0]
  def change
    create_table :saleitems do |t|
      t.integer :price_in_cents
      t.integer :qty
      t.references :product, null: false, foreign_key: true
      t.references :sale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
