class EvaluatorSerializer < ActiveModel::Serializer
  attributes :id, :name, :cvlac_url, :email, :mobile,
             :academic_title, :active, :created_by, :updated_by,
             :created_at, :updated_at
end
