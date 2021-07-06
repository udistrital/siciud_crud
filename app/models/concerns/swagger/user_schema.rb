module Swagger::UserSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :User do
      property :identification_number do
        key :type, :string
        key :example, '1122334455'
      end
      property :oas_user_id do
        key :type, :string
        key :example, '12345'
      end
      property :user_role_id do
        key :type, :integer
        key :format, :int64
      end
      property :faculties_ids do
        key :type, :array
        items do
          key :type, :integer
          key :format, :int64
        end
      end
    end

    swagger_schema :UserInputPost do
      allOf do
        schema do
          key :required, [:identification_number, :user_role_id]
          property :user do
            key :'$ref', :User
          end
        end
        schema do
          property :user do
            key :required, [:created_by]
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :UserInputPut do
      allOf do
        schema do
          key :required, [:identification_number, :user_role_id]
          property :user do
            key :'$ref', :User
          end
        end
        schema do
          property :user do
            key :required, [:created_by]
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :UserInputActive do
      allOf do
        schema do
          property :user do
            key :required, [:active, :updated_by]
            property :active do
              key :type, :boolean
            end
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :UserOutput do
      allOf do
        schema do
          key :'$ref', :User
        end
        schema do
          property :id do
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
      end
    end

    swagger_schema :CompleteUserOutput do
      allOf do
        schema do
          key :'$ref', :User
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :total_faculties do
            key :type, :integer
            key :format, :int64
          end
          property :total_structures do
            key :type, :integer
            key :format, :int64
          end
          property :total_active_structures do
            key :type, :integer
            key :format, :int64
          end
          property :total_inactive_structures do
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
      end
    end

    swagger_schema :UserDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :CompleteUserOutput
            end
          end
        end
      end
    end
  end
end