module Swagger::ActionPlanSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ActionPlan do
      property :execution_validity do
        key :type, :integer
        key :format, :int64
      end
      property :is_draft do
        key :type, :boolean
        key :default, true
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ActionPlanInputPost do
      allOf do
        schema do
          property :action_plan do
            key :'$ref', :ActionPlan
          end
        end
        schema do
          property :action_plan do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ActionPlanInputPut do
      allOf do
        schema do
          property :action_plan do
            key :'$ref', :ActionPlan
          end
        end
        schema do
          property :action_plan do
            property :research_group_id do
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

    swagger_schema :ApManagementReportInputPut do
      property :ap_management_report do
        property :management_report_is_draft do
          key :type, :boolean
          key :default, :true
        end
        property :updated_by do
          key :type, :integer
          key :format, :int64
        end
      end
    end

    swagger_schema :ActionPlanOutput do
      allOf do
        schema do
          key :'$ref', :ActionPlan
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :research_group_name do
            key :type, :string
          end
          property :research_group_acronym do
            key :type, :string
          end
          property :research_group_gruplac do
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
          property :published_at do
            key :type, :string
            key :format, 'date-time'
          end
        end
      end
    end

    swagger_schema :ActionPlanDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ActionPlanOutput
            end
          end
        end
      end
    end
  end
end