class Researcher < ApplicationRecord
  #Relaciones con los diferentes modelos
  has_one :user

  has_many :periods

  #Validaciones de los campos obligatorios
  validates :codeNumber, presence: true, uniqueness: true
  validates :identificationNumber, presence: true, uniqueness: true
end
