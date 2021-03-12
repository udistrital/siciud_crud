class Subtype < ApplicationRecord
  belongs_to :type

  belongs_to :parent, class_name: 'Subtype', optional: true

  has_many :subtypes, class_name: 'Subtype', foreign_key: 'parent_id'

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :st_name, presence: true, allow_blank: false, on: :create
  validates :st_name, exclusion: { in: [nil], message: "can't be nil" }
end
