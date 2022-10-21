class AddColumsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :position, :string
    add_column :users, :height, :string
    add_column :users, :plays_like, :string
  end
end
