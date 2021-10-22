module Swagger::TechnologicalSituationSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
        swagger_schema :TechnologicalSituation do
            property :development_stage_ids do
                key :type, :array
                items do
                    key :type, :integer
                    key :format, :int64
                end
            end
            property :invention_type_id do
                key :type, :integer
                key :format, :int64
            end
            property :required_equipment do
                key :type, :string
            end
            property :pending_development do
                key :type, :string
            end
            property :differential_factors do
                key :type, :string
            end
            property :pi_requested do
                key :type, :boolean
                key :default, false
            end
            property :media_spread do
                key :type, :boolean
                key :default, false
            end
            property :channel_spread do
                key :type, :string
            end
            property :spread_plans do
                key :type, :boolean
                key :default, false
            end
            property :technology_reason_ids do
                key :type, :array
                items do
                    key :type, :integer
                    key :format, :int64
                end
            end
        end
  
        swagger_schema :TechnologicalSituationInputPost do
            allOf do
                schema do
                    property :technological_situation do
                        key :'$ref', :TechnologicalSituation
                    end
                end
                schema do
                    property :technological_situation do
                        property :created_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :TechnologicalSituationInputPut do
            allOf do
                schema do
                    property :technological_situation do
                        key :'$ref', :TechnologicalSituation
                    end
                end
                schema do
                    property :technological_situation do
                        property :updated_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :TechnologicalSituationOutput do
            allOf do
                schema do
                    key :'$ref', :TechnologicalSituation
                end
                schema do
                    property :id do
                        key :type, :integer
                        key :format, :int64
                    end
                    property :created_by do
                        key :type, :integer
                        key :format, :int64
                    end
                    property :updated_by do
                        key :type, :integer
                        key :format, :int64
                    end
                    property :procedure_request_id do
                        key :type, :integer
                        key :format, :int64
                    end
                    property :active do
                        key :type, :boolean
                        key :default, true
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
  
    end
end