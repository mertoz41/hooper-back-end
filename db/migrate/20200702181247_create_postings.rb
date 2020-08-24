class CreatePostings < ActiveRecord::Migration[6.0]
  def change
    create_table :postings do |t|
      t.integer :user_id
      t.string :message
      t.integer :lattitude
      t.integer :longitude

      t.timestamps
    end
  end
end
