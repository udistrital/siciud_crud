module Swagger::AppropriationProcessSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :AppropriationProcess do
      property :name do
        key :type, :string
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :funding_institution do
        key :type, :string
      end
      property :start_date do
        key :type, :string
        key :format, :date
      end
      property :finish_date do
        key :type, :string
        key :format, :date
      end
      property :product_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :research_project_title do
        key :type, :string
      end
      property :observation do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :AppropriationProcessInputPost do
      allOf do
        schema do
          property :appropriation_process do
            key :'$ref', :AppropriationProcess
          end
        end
        schema do
          property :appropriation_process do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :AppropriationProcessInputPut do
      allOf do
        schema do
          property :appropriation_process do
            key :'$ref', :AppropriationProcess
          end
        end
        schema do
          property :appropriation_process do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :AppropriationProcessOutput do
      allOf do
        schema do
          key :'$ref', :AppropriationProcess
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
          property :product_type_name do
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

    swagger_schema :AppropriationProcessDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :AppropriationProcessOutput
            end
          end
        end
      end
    end
  end
end