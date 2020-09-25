class AddPasswordTokenToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_token, :string
  end
end
