class PostingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :message, :location_id, :created_at
end
