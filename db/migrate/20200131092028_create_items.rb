class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :detail, null: false
      t.integer :price,null: false
      t.integer :status, null: false, limit: 1
      t.string :region, null: false
      t.string :arrival_date,null: false
      
      t.references :user, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false
      t.references :brand, foreign_key: true
      t.timestamps
    end
  end
end
