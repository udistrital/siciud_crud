module Swagger::ResearchUnitSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ResearchUnit do
      property :name do
        key :type, :string
      end
      property :acronym do
        key :type, :string
      end
      property :cidc_act_number do
        key :type, :string
      end
      property :cidc_registration_date do
        key :type, :string
        key :format, :date
      end
      property :cine_broad_area_id do
        key :type, :integer
        key :format, :int64
      end
      property :cine_specific_area_id do
        key :type, :integer
        key :format, :int64
      end
      property :cine_detailed_area_ids do
        key :type, :array
        items do
          key :type, :integer
        end
      end
      property :colciencias_code do
        key :type, :string
      end
      property :curricular_project_ids do
        key :type, :array
        items do
          key :type, :integer
        end
      end
      property :description do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
      property :faculty_act_number do
        key :type, :string
      end
      property :faculty_ids do
        key :type, :array
        items do
          key :type, :integer
        end
      end
      property :faculty_registration_date do
        key :type, :string
        key :format, :date
      end
      property :group_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :group_state_id do
        key :type, :integer
        key :format, :int64
      end
      property :gruplac do
        key :type, :string
      end
      property :interinstitutional do
        key :type, :boolean
      end
      property :legacy_siciud_id do
        key :type, :integer
        key :format, :int64
      end
      property :mission do
        key :type, :string
      end
      property :oecd_knowledge_area_id do
        key :type, :integer
        key :format, :int64
      end
      property :oecd_knowledge_subarea_id do
        key :type, :integer
        key :format, :int64
      end
      property :oecd_discipline_ids do
        key :type, :array
        items do
          key :type, :integer
        end
      end
      property :research_focus_ids do
        key :type, :array
        items do
          key :type, :integer
        end
      end
      property :snies_id do
        key :type, :string
      end
      property :vision do
        key :type, :string
      end
      property :webpage do
        key :type, :string
      end
    end

    swagger_schema :ResearchUnitInputPost do
      allOf do
        schema do
          property :research_group do
            key :'$ref', :ResearchUnit
          end
        end
        schema do
          property :research_group do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ResearchUnitInputPut do
      allOf do
        schema do
          property :research_group do
            key :'$ref', :ResearchUnit
          end
        end
        schema do
          property :research_group do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ResearchUnitOutput do
      allOf do
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
        end
        schema do
          key :'$ref', :ResearchUnit
        end
        schema do
          property :member_ids do
            key :type, :array
            items do
              key :type, :integer
            end
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

    swagger_schema :ResearchUnitDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ResearchUnitOutput
            end
          end
        end
      end
    end
  end
end