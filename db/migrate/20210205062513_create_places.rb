class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string  :postal_number,      null: false
      t.integer :area_id,            null: false
      t.string  :city,               null: false
      t.string  :house_number,       null: false
      t.string  :building_name
      t.string  :phone_number,       null: false
      t.integer :purchase_record_id, null: false, foreign_key: true   
      t.timestamps
    end
  end
end
