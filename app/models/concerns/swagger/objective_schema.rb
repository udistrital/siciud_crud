module Swagger::ObjectiveSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Objective do
      property :description do
        key :type, :string
      end
      property :parent_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ObjectiveInputPost do
      allOf do
        schema do
          property :objective do
            key :'$ref', :Objective
          end
        end
        schema do
          property :objective do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ObjectiveInputPut do
      allOf do
        schema do
          property :objective do
            key :'$ref', :Objective
          end
        end
        schema do
          property :objective do
            property :proposal_id do
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

    swagger_schema :ObjectiveOutput do
      allOf do
        schema do
          key :'$ref', :Objective
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :proposal_id do
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

    swagger_schema :ObjectiveDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ObjectiveOutput
            end
          end
        end
      end
    end
  end
end