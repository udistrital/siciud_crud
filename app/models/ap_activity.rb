class ApActivity < ApplicationRecord
  include Swagger::ApActivitySchema

  validates :weight, :completedPercentage, presence: true
  validates :weight, numericality: { greater_than: 0 }
  belongs_to :ap_specific_goal
end
