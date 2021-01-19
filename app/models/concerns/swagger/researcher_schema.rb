module Swagger::ResearcherSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Researcher do
      key :required, [:id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :address do
        key :type, :string
      end
      property :identification_number do
        key :type, :string
      end
      property :mobile_number_one do
        key :type, :string
      end
      property :mobile_number_two do
        key :type, :string
      end
      property :oas_researcher_id do
        key :type, :string
      end
      property :orcid_id do
        key :type, :string
      end
      property :phone_number_one do
        key :type, :string
      end
      property :phone_number_two do
        key :type, :string
      end
      property :scientific_signature do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
      property :created_by do
        key :type, :integer
        key :format, :int64
      end
      property :updated_by do
        key :type, :integer
        key :format, :int64
      end
      property :created_at do
        key :type, :string
        key :format, 'date-time'
      end
      property :updated_at do
        key :type, :string
        key :format, 'date-time'
      end
    end

    swagger_schema :ResearcherInput do
      property :researcher do
        key :required, [:identification_number]
        property :address do
          key :type, :string
        end
        property :identification_number do
          key :type, :string
        end
        property :mobile_number_one do
          key :type, :string
        end
        property :mobile_number_two do
          key :type, :string
        end
        property :oas_researcher_id do
          key :type, :string
        end
        property :orcid_id do
          key :type, :string
        end
        property :phone_number_one do
          key :type, :string
        end
        property :phone_number_two do
          key :type, :string
        end
        property :scientific_signature do
          key :type, :string
        end
        property :active do
          key :type, :boolean
          key :default, true
        end
        property :created_by do
          key :type, :integer
          key :format, :int64
        end
        property :updated_by do
          key :type, :integer
          key :format, :int64
        end
      end
    end

    swagger_schema :ResearcherOutput do
      allOf do
        schema do
          key :'$ref', :Researcher
        end
      end
    end
  end
end