class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :items
  # has_many :items

  def items
    object.items.collect do |item|
      { :id => item.id, :title => item.title, :creator => item.creator, :image_url => item.image_url, :medium => item.medium, :tags => item.tags, :lists => item.lists }
    end
  end
end
