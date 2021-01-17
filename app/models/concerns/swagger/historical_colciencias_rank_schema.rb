module Swagger::HistoricalColcienciasRankSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :HistoricalColcienciasRank do
      key :required, [:id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property  :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property  :colciencias_category_id do
        key :type, :integer
        key :format, :int64
      end
      property :oecd_knowledge_area_id do
        key :type, :integer
        key :format, :int64
      end
      property :oecd_knowledge_subarea_id do
        key :type, :integer
        key :format, :int64
      end
      property  :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
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

    swagger_schema :HistoricalColcienciasRankInput do
      property :historical_colciencias_rank do
        property  :colciencias_call_id do
          key :type, :integer
          key :format, :int64
        end
        property  :colciencias_category_id do
          key :type, :integer
          key :format, :int64
        end
        property :oecd_knowledge_area_id do
          key :type, :integer
          key :format, :int64
        end
        property :oecd_knowledge_subarea_id do
          key :type, :integer
          key :format, :int64
        end
        property :active do
          key :type, :boolean
          key :default, true
        end
        property :created_by do
          key :type, :integer
          key :format, :int64
        end
        property :updated_by do
          key :type, :integer
          key :format, :int64
        end
      end
    end

    swagger_schema :HistoricalColcienciasRankOutput do
      allOf do
        schema do
          key :'$ref', :HistoricalColcienciasRank
        end
      end
    end
  end
end