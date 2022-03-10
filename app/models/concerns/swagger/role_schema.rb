module Swagger::RoleSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Role do
      property :name do
        key :type, :string
      end
      property :role_type_id do
        key :type, :integer
        key :format, :int64
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

    swagger_schema :RoleInputPut do
      allOf do
        schema do
          property :role do
            key :'$ref', :Role
          end
        end
        schema do
          property :role do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :RoleInputPost do
      allOf do
        schema do
          property :role do
            key :'$ref', :Role
          end
        end
        schema do
          property :role do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :RoleOutput do
      allOf do
        schema do
          key :'$ref', :Role
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :role_type_name do
            key :type, :string
          end
          property :parent_name do
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

    swagger_schema :RoleDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :RoleOutput
            end
          end
        end
      end
    end
  end
end