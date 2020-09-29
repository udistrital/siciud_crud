class FacultyIdsResearchGroup < ApplicationRecord
  belongs_to :research_group

  validates :faculty_id, uniqueness: {scope: :research_group_id,
                                     message: "should happen once per faculty and research group"}
end
