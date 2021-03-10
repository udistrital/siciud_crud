class Subtype < ApplicationRecord
  belongs_to :type

  belongs_to :parent, class_name: 'Subtype', optional: true

  has_many :subtypes, class_name: 'Subtype', foreign_key: 'parent_id'
end
