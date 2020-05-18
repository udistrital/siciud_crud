class AgreementResearchProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :year, :startDate, :approbationDate, :estimatedFinishDate, :closingDate, :budgetInKind, :budgetInCash, :totalBudget

  def budgetInKind
    self.object.contribution_rp_items.sum(:inKindValue)
  end

  def budgetInCash
    self.object.contribution_rp_items.sum(:cashValue)
  end

  def totalBudget
    self.object.contribution_rp_items.sum(:inKindValue) + self.object.contribution_rp_items.sum(:cashValue)
  end
end
