class FeedbackSerializer < ActiveModel::Serializer
    attributes :id, :message, :created_at, :supervisee_username, :supervisee_id

    def supervisee_username
        return object.supervisee.username
    end

  end
  