class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :creator
      t.string :image_url
      t.string :medium

      t.timestamps
    end
  end
end
