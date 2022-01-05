class AddComumunUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :age, :integer
  end
end
