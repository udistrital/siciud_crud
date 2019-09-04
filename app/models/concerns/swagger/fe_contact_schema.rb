module Swagger::FeContactSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :FeContact do
      key :required, [:id, :name]

      property :fe_contact do
        property :id do
          key :type, :integer
        end
        property :name do
          key :type, :string
        end
        property :lastName do
          key :type, :string
        end
        property :phoneNumber do
          key :type, :string
        end
        property :mobileNumber do
          key :type, :string
        end
        property :role do
          key :type, :string
        end
        property :funding_entity_id do
          key :type, :integer
        end
        property :email do
          key :type, :string
        end
      end
    end
  end
end
