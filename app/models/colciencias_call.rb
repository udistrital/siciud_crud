class ColcienciasCall < ApplicationRecord
  validates :name, presence: true
  validates :year, presence: true

end
