module Swagger::FormDActPlanSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :FormDActPlan do
      property :name do
        key :type, :string
      end
      property :description do
        key :type, :string
      end
      property :goal_state_id do
        key :type, :integer
        key :format, :int64
      end
      property :goal_achieved do
        key :type, :boolean
        key :default, true
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

    swagger_schema :FormDActPlanInputPost do
      allOf do
        schema do
          property :form_d_act_plan do
            key :'$ref', :FormDActPlan
          end
        end
        schema do
          property :form_d_act_plan do
            property :cine_detailed_area_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :cine_specific_area_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :oecd_discipline_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :oecd_knowledge_subarea_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :research_focus_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :snies_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :FormDActPlanInputPut do
      allOf do
        schema do
          property :form_d_act_plan do
            key :'$ref', :FormDActPlan
          end
        end
        schema do
          property :form_d_act_plan do
            property :action_plan_id do
              key :type, :integer
              key :format, :int64
            end
            property :cine_detailed_area_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :cine_specific_area_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :oecd_discipline_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :oecd_knowledge_subarea_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :research_focus_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :snies_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :FormDActPlanOutputBase do
      allOf do
        schema do
          key :'$ref', :FormDActPlan
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
          property :name do
            key :type, :string
          end
          property :description do
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

    swagger_schema :FormDActPlanOutput do
      allOf do
        schema do
          key :'$ref', :FormDActPlanOutputBase
        end
        schema do
          property :cine do
            key :type, :array
            items do
              key :type, :integer
              key :format, :int64
            end
          end
          property :oecd do
            key :type, :array
            items do
              key :type, :integer
              key :format, :int64
            end
          end
          property :research_focuses do
            key :type, :array
            items do
              key :type, :integer
              key :format, :int64
            end
          end
          property :snies do
            key :type, :array
            items do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :FormDActPlanDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :FormDActPlanOutputBase
            end
          end
        end
        schema do
          property :data do
            key :type, :array
            items do
              property :total_cine_detailed_areas do
                key :type, :integer
                key :format, :int64
              end
              property :total_cine_specific_areas do
                key :type, :integer
                key :format, :int64
              end
              property :total_oecd_disciplines do
                key :type, :integer
                key :format, :int64
              end
              property :total_oecd_knowledge_subareas do
                key :type, :integer
                key :format, :int64
              end
              property :total_research_focuses do
                key :type, :integer
                key :format, :int64
              end
              property :total_snies do
                key :type, :integer
                key :format, :int64
              end
            end
          end
        end
      end
    end
  end
end