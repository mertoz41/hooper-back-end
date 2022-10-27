class PostingSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :user_id, :message, :created_at, :username, :avatar

  def username
    return object.user.username
  end

  def avatar
    if object.user.avatar.attached?
      return rails_blob_path(object.user.avatar, only_path: true)
    end
  end
end
