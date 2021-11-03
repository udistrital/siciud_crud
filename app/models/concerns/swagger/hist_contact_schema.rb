module Swagger::HistContactSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :HistContact do
      property :contact_id do
        key :type, :integer
        key :format, :int64
      end
      property :is_current do
        key :type, :boolean
        key :default, true
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :HistContactInputPost do
      allOf do
        schema do
          property :hist_contact do
            key :'$ref', :HistContact
          end
        end
        schema do
          property :hist_contact do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :HistContactInputPut do
      allOf do
        schema do
          property :hist_contact do
            key :'$ref', :HistContact
          end
        end
        schema do
          property :hist_contact do
            property :dependency_id do
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

    swagger_schema :HistContactOutput do
      allOf do
        schema do
          key :'$ref', :HistContact
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :contact_name do
            key :type, :string
          end
          property :contact_email do
            key :type, :string
          end
          property :contact_phone do
            key :type, :string
          end
          property :dependency_id do
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

    swagger_schema :HistContactDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :HistContactOutput
            end
          end
        end
      end
    end
  end
end