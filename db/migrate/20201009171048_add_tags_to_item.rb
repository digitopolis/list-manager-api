class AddTagsToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :tags, :string, array: true, default: []
  end
end
