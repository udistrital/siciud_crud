class ThematicAxis < ApplicationRecord
  has_and_belongs_to_many :calls

  validates :name, uniqueness: true
end
