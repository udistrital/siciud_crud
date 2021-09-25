module Swagger::LegalRepresentativeSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :LegalRepresentative do
      property :name do
        key :type, :string
      end
      property :identification_number do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
      property :identification_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :LegalRepresentativeInputPost do
      allOf do
        schema do
          property :legal_representative do
            key :'$ref', :LegalRepresentative
          end
        end
        schema do
          property :legal_representative do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :LegalRepresentativeInputPut do
      allOf do
        schema do
          property :legal_representative do
            key :'$ref', :LegalRepresentative
          end
        end
        schema do
          property :legal_representative do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :LegalRepresentativeOutput do
      allOf do
        schema do
          key :'$ref', :LegalRepresentative
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :identification_type_name do
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

    swagger_schema :LegalRepresentativeDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :LegalRepresentativeOutput
            end
          end
        end
      end
    end
  end
end