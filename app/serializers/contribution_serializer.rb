class ContributionSerializer < ActiveModel::Serializer
  attributes :id,:agreement_id,:inKindContribution,:cashContribution,:funding_entity
  def funding_entity
    self.object.funding_entity
  end
end
