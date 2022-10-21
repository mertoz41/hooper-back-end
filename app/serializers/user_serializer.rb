class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :picture
  has_many :taught_by
  has_many :taught
end
