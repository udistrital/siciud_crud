module Swagger::ImpactSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Impact do
      property :impact_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :indicator_id do
        key :type, :integer
        key :format, :int64
      end
      property :description do
        key :type, :string
      end
      property :goal do
        key :type, :string
      end
      property :term_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ImpactInputPost do
      allOf do
        schema do
          property :impact do
            key :'$ref', :Impact
          end
        end
        schema do
          property :impact do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ImpactInputPut do
      allOf do
        schema do
          property :impact do
            key :'$ref', :Impact
          end
        end
        schema do
          property :impact do
            property :proposal_id do
              key :type, :integer
              key :format, :int64
            end
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ImpactOutput do
      allOf do
        schema do
          key :'$ref', :Impact
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :impact_type_name do
            key :type, :string
          end
          property :indicator_description do
            key :type, :string
          end
          property :term_name do
            key :type, :string
          end
          property :proposal_id do
            key :type, :integer
            key :format, :int64
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

    swagger_schema :ImpactDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ImpactOutput
            end
          end
        end
      end
    end
  end
end