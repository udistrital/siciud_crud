module Swagger::ExtParticipantSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ExtParticipant do
      property :first_name do
        key :type, :string
      end
      property :last_name do
        key :type, :string
      end
      property :participant_type_id do
        key :type, :integer
        key :format, :int64
      end
    end

    swagger_schema :ExtParticipantInputPut do
      allOf do
        schema do
          property :ext_participant do
            key :'$ref', :ExtParticipant
          end
        end
        schema do
          property :ext_participant do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ExtParticipantInputPost do
      allOf do
        schema do
          property :ext_participant do
            key :'$ref', :ExtParticipant
          end
        end
        schema do
          property :ext_participant do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ExtParticipantOutput do
      allOf do
        schema do
          key :'$ref', :ExtParticipant
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :participant_type_name do
            key :type, :string
          end
          property :product_type_id do
            key :type, :integer
            key :format, :int64
          end
          property :product_type do
            key :type, :string
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

    swagger_schema :ExtParticipantDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ExtParticipantOutput
            end
          end
        end
      end
    end

  end
end