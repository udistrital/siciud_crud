class Researcher < ApplicationRecord
  #Relaciones con los diferentes modelos
  has_one :user

  has_many :periods
  has_many :int_participants

  #Validaciones de los campos obligatorios
  validates :identification_number, presence: true, uniqueness: true
end
