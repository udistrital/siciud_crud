class GmState < ApplicationRecord
  include Swagger::GmStateSchema

  has_many :group_members

  validates :name, presence: true
end
