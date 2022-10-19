class PostingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :message, :created_at, :username

  def username
    return object.user.username
  end
end
