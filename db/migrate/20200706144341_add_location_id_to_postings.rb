class AddLocationIdToPostings < ActiveRecord::Migration[6.0]
  def change
    add_column :postings, :location_id, :integer
  end
end
