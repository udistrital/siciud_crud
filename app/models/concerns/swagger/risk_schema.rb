module Swagger::RiskSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Risk do
      property :name do
        key :type, :string
      end
      property :consequence do
        key :type, :string
      end
      property :mitigation do
        key :type, :string
      end
      property :activity_schedule_ids do
        key :type, :array
        items do
          key :type, :integer
          key :format, :int64
        end
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :RiskInputPost do
      allOf do
        schema do
          property :risk do
            key :'$ref', :Risk
          end
        end
        schema do
          property :risk do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :RiskInputPut do
      allOf do
        schema do
          property :risk do
            key :'$ref', :Risk
          end
        end
        schema do
          property :risk do
            property :proposal_id do
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

    swagger_schema :RiskOutput do
      allOf do
        schema do
          key :'$ref', :Risk
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :proposal_id do
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

    swagger_schema :RiskDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :RiskOutput
            end
          end
        end
      end
    end
  end
end