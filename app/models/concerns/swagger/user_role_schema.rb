module Swagger::UserRoleSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :UserRole do
      property :name do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :UserRoleInputPost do
      allOf do
        schema do
          property :user_role do
            key :'$ref', :UserRole
          end
        end
        schema do
          property :user_role do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :UserRoleInputPut do
      allOf do
        schema do
          property :user_role do
            key :'$ref', :UserRole
          end
        end
        schema do
          property :user_role do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :UserRoleOutput do
      allOf do
        schema do
          key :'$ref', :UserRole
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
  end
end