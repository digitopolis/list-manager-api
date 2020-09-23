class UserSerializer < ActiveModel::Serializer
  has_many :lists
  attributes :id, :email
end
