class FeedbackSerializer < ActiveModel::Serializer
    attributes :id, :message, :created_at, :supervisor_username, :supervisor_id

    def supervisor_username
        return object.supervisor.username
    end

  end
  