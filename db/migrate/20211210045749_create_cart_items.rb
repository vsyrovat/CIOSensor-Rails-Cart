class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.monetize :price
      t.decimal :count, precision: 10, scale: 3

      t.timestamps
    end
  end
end
