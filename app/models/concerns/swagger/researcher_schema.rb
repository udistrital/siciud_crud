module Swagger::ResearcherSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Researcher do
      property :identification_number do
        key :type, :string
      end
      property :orcid_id do
        key :type, :string
      end
      property :scientific_signature do
        key :type, :string
      end
      property :mobile_number_one do
        key :type, :string
      end
      property :mobile_number_two do
        key :type, :string
      end
      property :phone_number_one do
        key :type, :string
      end
      property :phone_number_two do
        key :type, :string
      end
      property :address do
        key :type, :string
      end
      property :oas_researcher_id do
        key :type, :string
      end
    end

    swagger_schema :ResearcherInputPost do
      allOf do
        schema do
          property :researcher do
            key :required, [:identification_number]
            key :'$ref', :Type
          end
        end
        schema do
          property :researcher do
            key :required, [:created_by]
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ResearcherInputPut do
      allOf do
        schema do
          property :researcher do
            key :required, [:identification_number]
            key :'$ref', :Type
          end
        end
        schema do
          property :researcher do
            key :required, [:updated_by]
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ResearcherOutput do
      allOf do
        schema do
          key :'$ref', :Researcher
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
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
      end
    end

    swagger_schema :ResearcherResearchUnitOutput do
      allOf do
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :identification_number do
            key :type, :string
          end
          property :oas_researcher_id do
            key :type, :string
          end
          property :researcher_is_active do
            key :type, :boolean
          end
          property :group_member_id do
            key :type, :integer
            key :format, :int64
          end
          property :role_id do
            key :type, :integer
            key :format, :int64
          end
          property :role_name do
            key :type, :string
          end
          property :gm_state_id do
            key :type, :integer
            key :format, :int64
          end
          property :group_member_is_active do
            key :type, :boolean
          end
          property :research_group_id do
            key :type, :integer
            key :format, :int64
          end
          property :research_group_name do
            key :type, :string
          end
          property :acronym do
            key :type, :string
          end
          property :group_type_id do
            key :type, :integer
            key :format, :int64
          end
          property :group_state_id do
            key :type, :integer
            key :format, :int64
          end
          property :legacy_siciud_id do
            key :type, :integer
            key :format, :int64
          end
        end
      end
    end

  end
end