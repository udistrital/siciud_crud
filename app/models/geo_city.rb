class GeoCity < ApplicationRecord
  belongs_to :geo_state

  has_one :book
  has_one :book_chapter

  has_one :ip_livestock_breed
  has_one :new_animal_breed
  has_one :paper
  has_one :patent
  has_one :research_creation_work
  has_one :scientific_note
  has_one :vegetable_variety
end
