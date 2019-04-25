class Researcher < ApplicationRecord
  belongs_to :document_type
  belongs_to :faculty
  belongs_to :curricular_project
  belongs_to :snies
  belongs_to :genre
  belongs_to :state_researcher
  has_many :periods

  validates :codeNumber, presence: true, uniqueness: true
  validates :identificationNumber, presence: true, uniqueness: true
  validates :name, presence: true
  validates :lastName, presence: true
  validates :academicEmail, presence: true, uniqueness: true  
  



end
