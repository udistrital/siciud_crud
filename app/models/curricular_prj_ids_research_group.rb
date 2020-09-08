class CurricularPrjIdsResearchGroup < ApplicationRecord
  belongs_to :research_group

  validates :curricular_projectId, uniqueness: {scope: :research_group_id,
                                     message: "should happen once per curricular project and research group"}
end
