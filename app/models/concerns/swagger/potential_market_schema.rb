module Swagger::PotentialMarketSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
        swagger_schema :PotentialMarket do
            property :segment_ids do
                key :type, :array
                items do
                    key :type, :integer
                    key :format, :int64
                end
            end
            property :market_participation_id do
                key :type, :integer
                key :format, :int64
            end
            property :necesary_time do
                key :type, :integer
                key :format, :int64
            end
            property :product_dependency do
                key :type, :boolean
                key :default, false
            end
            property :product_dependency_name do
                key :type, :string
            end
            property :institution_participation do
                key :type, :boolean
                key :default, false
            end
            property :institution_participation_name do
                key :type, :string
            end
            property :stakeholder do
                key :type, :string
            end
            property :success_rank_id do
                key :type, :integer
                key :format, :int64
            end
            property :market_place do
                key :type, :string
            end
            property :geo_country_ids do
                key :type, :array
                items do
                    key :type, :integer
                    key :format, :int64
                end
            end
        end
  
        swagger_schema :PotentialMarketInputPost do
            allOf do
                schema do
                    property :potential_market do
                        key :'$ref', :PotentialMarket
                    end
                end
                schema do
                    property :potential_market do
                        property :created_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :PotentialMarketInputPut do
            allOf do
                schema do
                    property :potential_market do
                        key :'$ref', :PotentialMarket
                    end
                end
                schema do
                    property :potential_market do
                        property :updated_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :PotentialMarketOutput do
            allOf do
                schema do
                    key :'$ref', :PotentialMarket
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