class ItemsList < ApplicationRecord
    belongs_to :item 
    belongs_to :list
end