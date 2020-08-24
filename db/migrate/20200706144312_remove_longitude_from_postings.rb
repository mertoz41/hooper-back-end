class RemoveLongitudeFromPostings < ActiveRecord::Migration[6.0]
  def change
    remove_column :postings, :longitude, :integer
  end
end
