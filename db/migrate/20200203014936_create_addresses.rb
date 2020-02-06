class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :post_code,           null: false
      t.string :prefecture,          null: false
      t.string :town,                null: false
      t.string :address_num,         null: false
      t.string :apartment_info 
      t.integer :user_id,            null: false 
      t.timestamps
      t.references :users, foreign_key: true
    end
  end
end
