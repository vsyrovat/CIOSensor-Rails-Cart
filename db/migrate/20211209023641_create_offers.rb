class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.references :unit, null: false, foreign_key: true
      t.references :good, null: false, foreign_key: true
      t.monetize :price

      t.timestamps
    end

    add_index :offers, [:unit_id, :good_id], unique: true
  end
end
