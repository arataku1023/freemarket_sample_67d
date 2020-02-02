class AddContentsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :name, :string
    add_index :items, :name
    add_column :items, :mail, :string
    add_column :items, :mail_way, :string
  end
end
