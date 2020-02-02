class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_num, null: false, unique: true
      t.string :security_code, null: false
      t.integer :expire_month,null: false
      t.integer :expire_year,null: false
      t.references :user, foreign_key: true,null: false

      t.timestamps
    end
  end
end
