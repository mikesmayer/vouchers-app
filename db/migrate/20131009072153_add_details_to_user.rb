class AddDetailsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :first_name , :string
  	add_column :users, :last_name, :string
  	add_column :users ,:user_type , :string , default: 'normal'
  end
end
