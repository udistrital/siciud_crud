module Swagger::DependencySchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Dependency do
      property :name do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :DependencyInputPost do
      allOf do
        schema do
          property :dependency do
            key :'$ref', :Dependency
          end
        end
        schema do
          property :dependency do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :DependencyInputPut do
      allOf do
        schema do
          property :dependency do
            key :'$ref', :Dependency
          end
        end
        schema do
          property :dependency do
            property :entity_id do
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

    swagger_schema :DependencyOutput do
      allOf do
        schema do
          key :'$ref', :Dependency
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

    swagger_schema :DependencyDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :DependencyOutput
            end
          end
        end
      end
    end
  end
end