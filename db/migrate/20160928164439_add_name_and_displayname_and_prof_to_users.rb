class AddNameAndDisplaynameAndProfToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :displayname, :string
    add_column :users, :prof, :string
  end
end
