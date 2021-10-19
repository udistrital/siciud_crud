module Swagger::HistLegalRepresentativeSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :HistLegalRepresentative do
      property :legal_representative_id do
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

    swagger_schema :HistLegalRepresentativeInputPost do
      allOf do
        schema do
          property :hist_legal_representative do
            key :'$ref', :HistLegalRepresentative
          end
        end
        schema do
          property :hist_legal_representative do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :HistLegalRepresentativeInputPut do
      allOf do
        schema do
          property :hist_legal_representative do
            key :'$ref', :HistLegalRepresentative
          end
        end
        schema do
          property :hist_legal_representative do
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

    swagger_schema :HistLegalRepresentativeOutput do
      allOf do
        schema do
          key :'$ref', :HistLegalRepresentative
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

    swagger_schema :HistLegalRepresentativeDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :HistLegalRepresentativeOutput
            end
          end
        end
      end
    end
  end
end