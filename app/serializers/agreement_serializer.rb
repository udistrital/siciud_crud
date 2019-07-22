class AgreementSerializer < ActiveModel::Serializer
  attributes :id
  attributes :id, :name, :registerDate, :startDate, :finalDate,
           :agreementNumber, :agreement_status_id, :agreement_type_id,
           :duration, :availability, :bizagiNumber, :description, :research_groups,:faculties,:funding_entities,:contributions,:agreement_research_projects 

  def faculties
   # self.object.research_groups.faculties
    #Faculty.where(research_groups: :faculty_ids)
    self.object.faculties.uniq
  end
end
