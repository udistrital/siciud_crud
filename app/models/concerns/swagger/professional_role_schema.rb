module Swagger::ProfessionalRoleSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ProfessionalRole do
      key :required, [:id]
      property :name do
        key :type, :string
      end
    end

    swagger_schema :ProfessionalRoleInputPost do
      allOf do
        schema do
          property :professional_role do
            key :'$ref', :ProfessionalRole
          end
        end
        schema do
          property :professional_role do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ProfessionalRoleInputPut do
      allOf do
        schema do
          property :professional_role do
            key :'$ref', :ProfessionalRole
          end
        end
        schema do
          property :professional_role do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ProfessionalRoleOutput do
      allOf do
        schema do
          key :'$ref', :ProfessionalRole
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
          property :active do
            key :type, :boolean
            key :default, true
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