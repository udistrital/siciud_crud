class Chapter < ApplicationRecord
  include Swagger::ChapterSchema

  belongs_to :ch_parent, class_name: 'Chapter', foreign_key: 'ch_parent_id', optional: true
  belongs_to :sectionable, polymorphic: true

  has_many :chapters, class_name: 'Chapter', foreign_key: 'ch_parent_id'

  validates :ch_order, :ch_title, :ch_description, presence: true
  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
