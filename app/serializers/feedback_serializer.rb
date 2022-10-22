class FeedbackSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :message, :created_at, :supervisor_username, :supervisor_id, :supervisee_username, :supervisee_id, :supervisor_avatar, :supervisee_avatar

    def supervisor_username
        return object.supervisor.username
    end

    def supervisor_avatar
        if object.supervisor.avatar.attached?
            return rails_blob_path(object.supervisor.avatar, only_path: true)
        end
    end

    def supervisee_avatar
        if object.supervisee.avatar.attached?
            return rails_blob_path(object.supervisee.avatar, only_path: true)
        end
    end
    
    def supervisee_username
        return object.supervisee.username
    end

  end
  