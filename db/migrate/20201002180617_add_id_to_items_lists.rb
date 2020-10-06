class AddIdToItemsLists < ActiveRecord::Migration[6.0]
  def change
    add_column :items_lists, :id, :primary_key
  end
end
