module Swagger::IdiInvestigationProjectSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :IdiInvestigationProject do
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :contract_number do
        key :type, :string
      end
      property :funding_institution do
        key :type, :string
      end
      property :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_country_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_state_id do
        key :type, :integer
        key :format, :int64
      end
      property :institution do
        key :type, :string
      end
      property :observation do
        key :type, :string
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :title do
        key :type, :string
      end
      property :year do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :IdiInvestigationProjectInputPost do
      allOf do
        schema do
          property :idi_investigation_project do
            key :'$ref', :IdiInvestigationProject
          end
        end
        schema do
          property :idi_investigation_project do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :IdiInvestigationProjectInputPut do
      allOf do
        schema do
          property :idi_investigation_project do
            key :'$ref', :IdiInvestigationProject
          end
        end
        schema do
          property :idi_investigation_project do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :IdiInvestigationProjectOutput do
      allOf do
        schema do
          key :'$ref', :IdiInvestigationProject
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :category_name do
            key :type, :string
          end
          property :colciencias_call_name do
            key :type, :string
          end
          property :colciencias_call_year do
            key :type, :integer
            key :format, :int64
          end
          property :geo_city_name do
            key :type, :string
          end
          property :geo_country_name do
            key :type, :string
          end
          property :geo_state_name do
            key :type, :string
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

    swagger_schema :IdiInvestigationProjectDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :IdiInvestigationProjectOutput
            end
          end
        end
      end
    end
  end
end