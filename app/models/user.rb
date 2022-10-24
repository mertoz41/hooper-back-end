class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar
    has_many :comments, dependent: :destroy
    has_many :postings, dependent: :destroy


    has_many :taught_by, class_name: "Feedback", foreign_key: :supervisee_id, dependent: :destroy
    has_many :supervisors, through: :taught_by, source: :supervisor, dependent: :destroy
    has_many :taught, class_name: "Feedback", foreign_key: :supervisor_id, dependent: :destroy
    has_many :supervisees, through: :taught, source: :supervisee, dependent: :destroy

    validates :username, uniqueness: { case_sensitive: false }
    validates :username, length: { minimum: 6, maximum: 12}
end
