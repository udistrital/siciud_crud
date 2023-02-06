class ImpactSerializer < ActiveModel::Serializer
  attributes :id, :impact_type_id, :impact_type_name, :description, :goal,
             :indicator_id, :indicator_description, :proposal_id, :term_id,
             :term_name, :active, :created_by, :updated_by, :created_at, :updated_at

  def impact_type_name
    impact_type = self.object.impact_type
    if impact_type
      impact_type.st_name
    end
  end

  def indicator_description
    indicator = self.object.indicator
    if indicator
      indicator.ind_description
    end
  end

  def term_name
    term = self.object.term
    if term
      term.st_name
    end
  end
end
