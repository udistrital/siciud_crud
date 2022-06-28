module Swagger::MobilityCallCriterionSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :MobilityCallCriterion do
      property :call_eval_criterion_id do
        key :type, :integer
        key :format, :int64
      end
      property :value do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :MobilityCallCriterionInputPost do
      allOf do
        schema do
          property :mobility_call_criterion do
            property :criteria do
              key :type, :array
              items do
                key :'$ref', :MobilityCallCriterion
              end
            end
          end
        end
        schema do
          property :mobility_call_criterion do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :MobilityCallCriterionInputPut do
      allOf do
        schema do
          property :mobility_call_criterion do
            key :'$ref', :MobilityCallCriterion
          end
        end
        schema do
          property :mobility_call_criterion do
            property :mobility_call_id do
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

    swagger_schema :MobilityCallCriterionOutput do
      allOf do
        schema do
          key :'$ref', :MobilityCallCriterion
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :mobility_call_id do
            key :type, :integer
            key :format, :int64
          end
          property :eval_criterion_id do
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

    swagger_schema :MobilityCallCriterionDxOutput do
      allOf do
        schema do
          property :data do
            property :criteria do
              key :type, :array
              items do
                key :'$ref', :MobilityCallCriterion
              end
            end
          end
        end
        schema do
          property :data do
            property :mobility_call_id do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end
  end
end