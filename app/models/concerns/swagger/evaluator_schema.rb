module Swagger::EvaluatorSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Evaluator do
      property :name do
        key :type, :string
      end
      property :cvlac_url do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
      property :mobile do
        key :type, :string
      end
      property :academic_title do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :EvaluatorInputPost do
      allOf do
        schema do
          property :evaluator do
            key :'$ref', :Evaluator
          end
        end
        schema do
          property :evaluator do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :EvaluatorInputPut do
      allOf do
        schema do
          property :evaluator do
            key :'$ref', :Evaluator
          end
        end
        schema do
          property :evaluator do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :EvaluatorOutput do
      allOf do
        schema do
          key :'$ref', :Evaluator
        end
        schema do
          property :id do
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

    swagger_schema :EvaluatorDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :EvaluatorOutput
            end
          end
        end
      end
    end
  end
end