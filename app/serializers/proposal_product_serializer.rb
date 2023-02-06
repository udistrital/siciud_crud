class ProposalProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :beneficiary, :indicator_id,
             :indicator_description, :product_type_id, :product_type_name,
             :proposal_id, :validated, :researchers,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def indicator_description
    indicator = self.object.indicator
    if indicator
      indicator.ind_description
    end
  end

  def product_type_name
    product_type = self.object.product_type
    if product_type
      product_type.st_name
    end
  end

  def researchers
    researchers_ = self.object.researchers
    result = []
    if researchers_
      researchers_.each do |researcher|
        result.append({
                        "id": researcher.id,
                        "oas_researcher_id": researcher.oas_researcher_id,
                        "identification_number": researcher.identification_number
                      })
      end
    end
    return result
  end
end
