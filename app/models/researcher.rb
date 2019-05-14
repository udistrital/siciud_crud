class Researcher < ApplicationRecord
  #Relaciones con los diferentes modelos
  belongs_to :document_type
  belongs_to :faculty
  belongs_to :curricular_project
  belongs_to :snies
  belongs_to :genre
  belongs_to :researcher_type

  has_many :periods

  #Validaciones de los campos obligatorios
  validates :codeNumber, presence: true, uniqueness: true
  validates :identificationNumber, presence: true, uniqueness: true
  validates :name, presence: true
  validates :lastName, presence: true
  validates :academicEmail, presence: true, uniqueness: true  
  



end
