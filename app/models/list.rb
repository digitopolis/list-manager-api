class List < ApplicationRecord
  belongs_to :user
  has_many :items_lists, dependent: :destroy
  has_many :items, through: :items_lists
end
