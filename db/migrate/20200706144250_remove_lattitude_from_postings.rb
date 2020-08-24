class RemoveLattitudeFromPostings < ActiveRecord::Migration[6.0]
  def change
    remove_column :postings, :lattitude, :integer
  end
end
