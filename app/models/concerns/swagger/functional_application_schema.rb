module Swagger::FunctionalApplicationSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
        swagger_schema :FunctionalApplication do
            property :actual_applications do
                key :type, :string
            end
            property :future_applications do
                key :type, :string
            end
            property :alternative_technologies do
                key :type, :string
            end
            property :advantages do
                key :type, :string
            end
        end
  
        swagger_schema :FunctionalApplicationInputPost do
            allOf do
                schema do
                    property :functional_application do
                        key :'$ref', :FunctionalApplication
                    end
                end
                schema do
                    property :functional_application do
                        property :created_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :FunctionalApplicationInputPut do
            allOf do
                schema do
                    property :functional_application do
                        key :'$ref', :FunctionalApplication
                    end
                end
                schema do
                    property :functional_application do
                        property :updated_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :FunctionalApplicationOutput do
            allOf do
                schema do
                    key :'$ref', :FunctionalApplication
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