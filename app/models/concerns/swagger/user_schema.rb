module Swagger::UserSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :User do
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :identification_number do
        key :type, :string
      end
      property :oas_user_id do
        key :type, :string
      end
      property :user_role_id do
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

    swagger_schema :UserInput do
      property :user do
        key :required, [:identification_number]
        property :identification_number do
          key :type, :string
        end
        property :oas_user_id do
          key :type, :string
        end
        property :user_role_id do
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

    swagger_schema :UserOutput do
      allOf do
        schema do
          key :'$ref', :User
        end
      end
    end

    swagger_schema :UserDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :UserOutput
            end
          end
        end
      end
    end
  end
end