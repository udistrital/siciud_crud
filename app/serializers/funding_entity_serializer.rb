class FundingEntitySerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :city,
             :phoneNumber, :mobileNumber,:observation,:address,
             :entity_type

  def entity_type
   self.object.entity_type
  end
end
