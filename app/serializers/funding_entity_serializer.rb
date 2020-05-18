class FundingEntitySerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :city,
             :phoneNumber, :mobileNumber,:observation,:address,
             :entity_type_id,:fe_contacts

end
