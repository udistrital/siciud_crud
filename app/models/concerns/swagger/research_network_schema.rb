module Swagger::ResearchNetworkSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ResearchNetwork do
      property :name do
        key :type, :string
      end
      property :acronym do
        key :type, :string
      end
      property :advantage do
        key :type, :string
      end
      property :academic_responsibilities do
        key :type, :string
      end
      property :financial_responsibilities do
        key :type, :string
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
      property :faculty_ids do
        key :type, :array
        items do
          key :type, :integer
        end
      end
      property :legal_responsibilities do
        key :type, :string
      end
      property :main_research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :mission do
        key :type, :string
      end
      property :network_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :oecd_discipline_ids do
        key :type, :array
        items do
          key :type, :integer
        end
      end
      property :oecd_knowledge_area_id do
        key :type, :integer
        key :format, :int64
      end
      property :oecd_knowledge_subarea_id do
        key :type, :integer
        key :format, :int64
      end
      property :request_date do
        key :type, :string
        key :format, :date
      end
      property :research_focus_ids do
        key :type, :array
        items do
          key :type, :integer
        end
      end
      property :researcher_id do
        key :type, :integer
        key :format, :int64
      end
      property :snies_ids do
        key :type, :array
        items do
          key :type, :integer
        end
      end
      property :vision do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ResearchNetworkInputPost do
      allOf do
        schema do
          property :research_network do
            key :'$ref', :ResearchNetwork
          end
        end
        schema do
          property :research_network do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ResearchNetworkInputPut do
      allOf do
        schema do
          property :research_network do
            key :'$ref', :ResearchNetwork
          end
        end
        schema do
          property :research_network do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ResearchNetworkOutput do
      allOf do
        schema do
          key :'$ref', :ResearchNetwork
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :cine_broad_area_name do
            key :type, :string
          end
          property :cine_specific_area_name do
            key :type, :string
          end
          property :main_research_group_name do
            key :type, :string
          end
          property :network_type_name do
            key :type, :string
          end
          property :oecd_knowledge_area_name do
            key :type, :string
          end
          property :oecd_knowledge_subarea_name do
            key :type, :string
          end
          property :researcher_identification_number do
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

    swagger_schema :ResearchNetworkDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ResearchNetworkOutput
            end
          end
        end
      end
    end
  end
end