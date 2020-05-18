class ContributionSerializer < ActiveModel::Serializer
  attributes :id,:agreement_id,:inKindContribution,:cashContribution,:funding_entity_id
  #def funding_entity
    #self.object.funding_entity
  #end
end
