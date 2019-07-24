class AgreementSerializer < ActiveModel::Serializer
  attributes :id
  attributes :id, :name, :registerDate, :startDate, :finalDate,
           :agreementNumber, :agreement_status_id, :agreement_type_id,
           :duration, :availability, :bizagiNumber, :description, :research_groups,:faculties,:funding_entities,:contributions,:agreement_research_projects,
           :budgetInKind,:budgetInCash, :totalBudget

  def faculties
   # self.object.research_groups.faculties
    #Faculty.where(research_groups: :faculty_ids)
    self.object.faculties.uniq
  end
  def budgetInKind 
    self.object.contributions.sum(:inKindContribution)
  end
def budgetInCash
  self.object.contributions.sum(:cashContribution)
end
def totalBudget
  self.object.contributions.sum(:inKindContribution)+self.object.contributions.sum(:cashContribution)
end
end
