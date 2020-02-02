class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :last_name,null: false
      t.string :first_name,null: false
      t.string :last_name_kana,null: false
      t.string :last_name_kana,null: false

      t.string :post_code,null: false
      t.string :prefecture,null: false
      t.string :town,null: false
      t.string :address_num,null: false

      t.string :apartment_info
      t.string :recipient_num

      t.references :user, foreign_key: true,null: false

      t.timestamps
    end
  end
end
