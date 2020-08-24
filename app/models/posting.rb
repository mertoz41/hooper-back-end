class Posting < ApplicationRecord
    belongs_to :user
    has_many :comments 
    belongs_to :location
end
