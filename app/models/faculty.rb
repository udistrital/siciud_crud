class Faculty < ApplicationRecord
    has_many :curricular_projects
    has_many :research_focuses, class_name: 'ResearchFocus'
    has_many :researchers

    validates :name, presence: true

end
