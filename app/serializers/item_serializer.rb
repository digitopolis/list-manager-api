class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :creator, :image_url, :medium
  has_many :lists
end
