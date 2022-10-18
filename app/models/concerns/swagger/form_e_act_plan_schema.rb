module Swagger::FormEActPlanSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :FormEActPlan do
      property :type_description do
        key :type, :string
      end
      property :description do
        key :type, :string
      end
      property :classification_id do
        key :type, :integer
        key :format, :int64
      end
      property :inventoried do
        key :type, :boolean
      end
      property :inventory_plate do
        key :type, :string
      end
      property :plan_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :value do
        key :type, :number
        key :format, :float
      end
      property :state_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :FormEActPlanInputPost do
      allOf do
        schema do
          property :form_e_act_plan do
            key :'$ref', :FormEActPlan
          end
        end
        schema do
          property :form_e_act_plan do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :FormEActPlanInputPut do
      allOf do
        schema do
          property :form_e_act_plan do
            key :'$ref', :FormEActPlan
          end
        end
        schema do
          property :form_e_act_plan do
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

    swagger_schema :FormEActPlanOutput do
      allOf do
        schema do
          key :'$ref', :FormEActPlan
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
          property :classification_name do
            key :type, :string
          end
          property :plan_type_name do
            key :type, :string
          end
          property :state_name do
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

    swagger_schema :FormEActPlanDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :FormEActPlanOutput
            end
          end
        end
      end
    end
  end
end