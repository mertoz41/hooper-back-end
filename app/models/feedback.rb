class Feedback < ApplicationRecord
    belongs_to :supervisee, class_name: "User", foreign_key: :supervisee_id
    belongs_to :supervisor, class_name: "User", foreign_key: :supervisor_id
end
