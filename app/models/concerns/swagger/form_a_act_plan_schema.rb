module Swagger::FormAActPlanSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :FormAActPlan do
      property :advanced_total do
        key :type, :integer
        key :format, :int64
      end
      property :goal do
        key :type, :integer
        key :format, :int64
      end
      property :indicator_id do
        key :type, :integer
        key :format, :int64
      end
      property :order do
        key :type, :integer
        key :format, :int64
      end
      property :plan_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :product_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :FormAActPlanInputPost do
      allOf do
        schema do
          property :form_a_act_plan do
            key :'$ref', :FormAActPlan
          end
        end
        schema do
          property :form_a_act_plan do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :FormAActPlanInputPut do
      allOf do
        schema do
          property :form_a_act_plan do
            key :'$ref', :FormAActPlan
          end
        end
        schema do
          property :form_a_act_plan do
            property :action_plan_id do
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

    swagger_schema :FormAActPlanOutput do
      allOf do
        schema do
          key :'$ref', :FormAActPlan
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :action_plan_id do
            key :type, :integer
            key :format, :int64
          end
          property :indicator_description do
            key :type, :string
          end
          property :indicator_product_type_id do
            key :type, :integer
            key :format, :int64
          end
          property :indicator_product_type_name do
            key :type, :string
          end
          property :plan_type_name do
            key :type, :string
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

    swagger_schema :FormAActPlanDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :FormAActPlanOutput
            end
          end
        end
      end
    end
  end
end