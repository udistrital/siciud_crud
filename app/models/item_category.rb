class ItemCategory < ApplicationRecord
    has_many :contribution_funding_entity_items
    has_many :call_item_categories
    has_many :calls, through: :call_item_categories
end
