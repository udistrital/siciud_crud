class AgreementSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :registerDate, :startDate, :finalDate,
             :agreementNumber, :agreement_status_id, :agreement_type_id,
             :duration, :availability, :bizagiNumber, :description, :research_group_ids, :faculty_ids, :funding_entity_ids, :contributions, :agreement_research_project_ids,
             :budgetInKind, :budgetInCash, :totalBudget, :contractDocument, :initialActDocument, :mainResearchers

  #def faculties
  # self.object.research_groups.faculties
  #Faculty.where(research_groups: :faculty_ids)
  #   self.object.faculties.uniq
  #  end

  def budgetInKind
    self.object.contributions.sum(:inKindContribution)
  end

  def budgetInCash
    self.object.contributions.sum(:cashContribution)
  end

  def totalBudget
    self.object.contributions.sum(:inKindContribution) + self.object.contributions.sum(:cashContribution)
  end

  def mainResearchers
    self.object.arp_members.find_by(arp_role_id: 1) 
  end

  def contractDocument
    rails_blob_path(self.object.contractDocument, only_path: true) if self.object.contractDocument.attached?
  end

  def initialActDocument
    rails_blob_path(self.object.initialActDocument, only_path: true) if self.object.initialActDocument.attached?
  end
end
