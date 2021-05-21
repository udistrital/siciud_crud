module Swagger::PatentSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Patent do
      property :title do
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
      property :date_of_obtaining do
        key :type, :string
        key :format, :date
      end
      property :geo_country_ids do
        key :type, :array
        items do
          key :type, :integer
          key :format, :int64
        end
      end
      property :industrial_publication_gazette do
        key :type, :string
      end
      property :observation do
        key :type, :string
      end
      property :patent_number do
        key :type, :string
      end
      property :patent_state_id do
        key :type, :integer
        key :format, :int64
      end
      property :patent_type_id do
        key :type, :integer
        key :format, :int64
      end
    end

    swagger_schema :PatentInputPost do
      allOf do
        schema do
          property :patent do
            key :'$ref', :Patent
          end
        end
        schema do
          property :patent do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :PatentInputPut do
      allOf do
        schema do
          property :patent do
            key :'$ref', :Patent
          end
        end
        schema do
          property :patent do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :PatentOutput do
      allOf do
        schema do
          key :'$ref', :Patent
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :category_name do
            key :type, :string
          end
          property :patent_state_name do
            key :type, :string
          end
          property :patent_type_name do
            key :type, :string
          end
          property :research_group_id do
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

    swagger_schema :PatentDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :PatentOutput
            end
          end
        end
      end
    end
  end
end