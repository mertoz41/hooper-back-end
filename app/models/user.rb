class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar
    has_many :comments
    has_many :postings


    has_many :taught_by, class_name: "Feedback", foreign_key: :supervisee_id
    has_many :supervisors, through: :taught_by, source: :supervisor
    has_many :taught, class_name: "Feedback", foreign_key: :supervisor_id
    has_many :supervisees, through: :taught, source: :supervisee

    validates :username, uniqueness: { case_sensitive: false }
end
