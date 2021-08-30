module Swagger::SniesSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Snies do
      property :code do
        key :type, :string
      end
      property :name do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :SniesInputPost do
      allOf do
        schema do
          property :snies do
            key :'$ref', :Snies
          end
        end
        schema do
          property :snies do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :SniesInputPut do
      allOf do
        schema do
          property :snies do
            key :'$ref', :Snies
          end
        end
        schema do
          property :snies do
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

    swagger_schema :SniesOutput do
      allOf do
        schema do
          key :'$ref', :Snies
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

    swagger_schema :SniesDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :SniesOutput
            end
          end
        end
      end
    end
  end
end