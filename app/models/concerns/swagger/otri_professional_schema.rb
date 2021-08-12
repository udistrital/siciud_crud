module Swagger::OtriProfessionalSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_schema :OtriProfessional do
        key :required, [:id]
        property :email do
            key :type, :string
        end
        property :phone do
            key :type, :string
        end
        property :professional_role_id do
            key :type, :integer
            key :format, :int64
        end
      end
  
      swagger_schema :OtriProfessionalInputPost do
        allOf do
          schema do
            property :otri_professional do
              key :'$ref', :OtriProfessional
            end
          end
          schema do
            property :otri_professional do
              property :created_by do
                key :type, :integer
                key :format, :int64
              end
              property :user_id do
                key :type, :integer
                key :format, :int64
              end
            end
          end
        end
      end
  
      swagger_schema :OtriProfessionalInputPut do
        allOf do
          schema do
            property :otri_professional do
              key :'$ref', :OtriProfessional
            end
          end
          schema do
            property :otri_professional do
              property :updated_by do
                key :type, :integer
                key :format, :int64
              end
            end
          end
        end
      end
  
      swagger_schema :OtriProfessionalOutput do
        allOf do
          schema do
            key :'$ref', :OtriProfessional
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