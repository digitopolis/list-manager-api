class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :creator, :image_url, :medium, :tags
  has_many :lists
end
