class ColcienciasCall < ApplicationRecord
  #Validaciones de los campos obligatorios 
  validates :name, presence: true
  validates :year, presence: true

end
