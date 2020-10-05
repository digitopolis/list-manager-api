class Item < ApplicationRecord
    has_many :items_lists, dependent: :destroy
    has_many :lists, through: :items_lists
end
