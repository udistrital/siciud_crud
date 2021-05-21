class GeoCity < ApplicationRecord
  include Swagger::GeoCitySchema

  belongs_to :geo_state

  # Products
  has_many :books
  has_many :book_chapters
  has_many :ip_livestock_breed
  has_many :new_animal_breed
  has_many :papers
  has_many :research_creation_work
  has_many :scientific_note
  has_many :vegetable_variety
end
