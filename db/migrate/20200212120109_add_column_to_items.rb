class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :buyer_id, :bigint
    add_column :items, :sold_status, :integer
  end
end
