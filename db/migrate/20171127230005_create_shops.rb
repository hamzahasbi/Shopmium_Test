class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string "chain" , :null => false
      t.string "name", :null => false
      t.float "latitude" , :null => false
      t.float "longitude", :null => false
      t.text "adress", :null => false
      t.string "city", :null => false
      t.string "zip", :null => false , :unique => true
      t.string "phone", :null => false
      t.string "country_code", :null => false
      t.timestamps
    end
  end
end
