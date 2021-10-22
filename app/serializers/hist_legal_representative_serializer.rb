class HistLegalRepresentativeSerializer < ActiveModel::Serializer
  attributes :id, :entity_id, :entity_name,
             :legal_representative_id, :legal_representative_name,
             :legal_representative_identification,
             :legal_representative_email,
             :legal_representative_identification_type,
             :is_current, :active, :created_by, :updated_by,
             :created_at, :updated_at

  def entity_name
    entity = self.object.entity
    if entity
      entity.name
    end
  end

  def legal_representative_name
    lr = self.object.legal_representative
    if lr
      lr.name
    end
  end

  def legal_representative_identification
    lr = self.object.legal_representative
    if lr
      lr.identification_number
    end
  end

  def legal_representative_email
    lr = self.object.legal_representative
    if lr
      lr.email
    end
  end

  def legal_representative_identification_type
    lr = self.object.legal_representative
    if lr
      lr.identification_type_id
    end
  end
end
