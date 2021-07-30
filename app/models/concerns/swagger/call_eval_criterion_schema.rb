module Swagger::CallEvalCriterionSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :CallEvalCriterion do
      property :eval_criterion_id do
        key :type, :integer
        key :format, :int64
      end
      property :cec_percentage do
        key :type, :number
        key :format, :float
        key :minimum, 0
        key :exclusiveMinimum, false
        key :maximum, 100
        key :exclusiveMaximum, false
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :CallEvalCriterionInputPost do
      allOf do
        schema do
          property :call_eval_criterion do
            key :'$ref', :CallEvalCriterion
          end
        end
        schema do
          property :call_eval_criterion do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :CallEvalCriterionInputPut do
      allOf do
        schema do
          property :call_eval_criterion do
            key :'$ref', :CallEvalCriterion
          end
        end
        schema do
          property :call_eval_criterion do
            property :call_id do
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

    swagger_schema :CallEvalCriterionOutput do
      allOf do
        schema do
          key :'$ref', :CallEvalCriterion
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :call_id do
            key :type, :integer
            key :format, :int64
          end
          property :eval_criterion_name do
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

    swagger_schema :CallEvalCriterionDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :CallEvalCriterionOutput
            end
          end
        end
      end
    end
  end
end