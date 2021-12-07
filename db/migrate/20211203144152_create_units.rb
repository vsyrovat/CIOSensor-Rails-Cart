class CreateUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :units do |t|
      t.string :name

      t.timestamps
    end
    add_index :units, :name, unique: true
  end
end
