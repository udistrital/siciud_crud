class OtriProfessional < ApplicationRecord
  include Swagger::OtriProfessionalSchema
  belongs_to :user
  belongs_to :professional_role
end
