module Swagger::FormBActPlanSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :FormBActPlan do
      property :description do
        key :type, :string
      end
      property :financing_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :goal_state_id do
        key :type, :integer
        key :format, :int64
      end
      property :goal_achieved do
        key :type, :boolean
        key :default, false
      end
      property :order do
        key :type, :integer
        key :format, :int64
      end
      property :plan_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :FormBActPlanInputPost do
      allOf do
        schema do
          property :form_b_act_plan do
            key :'$ref', :FormBActPlan
          end
        end
        schema do
          property :form_b_act_plan do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :FormBActPlanInputPut do
      allOf do
        schema do
          property :form_b_act_plan do
            key :'$ref', :FormBActPlan
          end
        end
        schema do
          property :form_b_act_plan do
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

    swagger_schema :FormBActPlanOutput do
      allOf do
        schema do
          key :'$ref', :FormBActPlan
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
          property :financing_type_name do
            key :type, :string
          end
          property :goal_state_name do
            key :type, :string
          end
          property :plan_type_name do
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

    swagger_schema :FormBActPlanDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :FormBActPlanOutput
            end
          end
        end
      end
    end
  end
end