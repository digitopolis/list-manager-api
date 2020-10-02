class Item < ApplicationRecord
    has_many :items_lists
    has_many :lists, through: :items_lists
end
