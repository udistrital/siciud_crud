class CurricularProject < ApplicationRecord
  belongs_to :faculty
  has_many :researchers
  validates :name, presence: true

end
