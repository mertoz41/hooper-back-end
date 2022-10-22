class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :avatar, :position, :height, :plays_like
  attribute :avatar, if: -> {object.avatar.present?}
  has_many :taught_by
  has_many :taught
  def avatar
    return rails_blob_path(object.avatar, only_path: true)
  end
end
