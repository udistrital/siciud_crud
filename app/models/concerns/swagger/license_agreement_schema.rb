module Swagger::LicenseAgreementSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :LicenseAgreement do
      property :work_name do
        key :type, :string
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :contract_date do
        key :type, :string
        key :format, :date
      end
      property :contract_geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property :license_grant_date do
        key :type, :string
        key :format, :date
      end
      property :license_owner_institution do
        key :type, :string
      end
      property :ncd_registry_number do
        key :type, :string
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :observation do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :LicenseAgreementInputPost do
      allOf do
        schema do
          property :license_agreement do
            key :'$ref', :LicenseAgreement
          end
        end
        schema do
          property :license_agreement do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :LicenseAgreementInputPut do
      allOf do
        schema do
          property :license_agreement do
            key :'$ref', :LicenseAgreement
          end
        end
        schema do
          property :license_agreement do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :LicenseAgreementOutput do
      allOf do
        schema do
          key :'$ref', :LicenseAgreement
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :category_name do
            key :type, :string
          end
          property :colciencias_call_name do
            key :type, :string
          end
          property :colciencias_call_year do
            key :type, :integer
            key :format, :int64
          end
          property :geo_city_name do
            key :type, :string
          end
          property :geo_country_id do
            key :type, :integer
            key :format, :int64
          end
          property :geo_country_name do
            key :type, :string
          end
          property :geo_state_id do
            key :type, :integer
            key :format, :int64
          end
          property :geo_state_name do
            key :type, :string
          end
          property :contract_geo_city_name do
            key :type, :string
          end
          property :contract_geo_country_id do
            key :type, :integer
            key :format, :int64
          end
          property :contract_geo_country_name do
            key :type, :string
          end
          property :contract_geo_state_id do
            key :type, :integer
            key :format, :int64
          end
          property :contract_geo_state_name do
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

    swagger_schema :LicenseAgreementDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :LicenseAgreementOutput
            end
          end
        end
      end
    end
  end
end