class Researcher < ApplicationRecord
  #Relaciones con los diferentes modelos
  has_one :user

  has_many :periods

  #Validaciones de los campos obligatorios
  validates :identification_number, presence: true, uniqueness: true
end
