class Faculty < ApplicationRecord
    #Relaciones con los diferentes modelos
    has_many :curricular_projects
    has_many :research_focuses, class_name: 'ResearchFocus'
    has_many :researchers
    has_and_belongs_to_many :research_groups
    #Validaciones de los campos obligatorios
    validates :name, presence: true

end
