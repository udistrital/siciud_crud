module Swagger::IntParticipantSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :IntParticipant do
      property :participant_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :researcher_id do
        key :type, :integer
        key :format, :int64
      end
    end

    swagger_schema :IntParticipantInputPut do
      allOf do
        schema do
          property :int_participant do
            key :'$ref', :IntParticipant
          end
        end
        schema do
          property :int_participant do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :IntParticipantInputPost do
      allOf do
        schema do
          property :int_participant do
            key :'$ref', :IntParticipant
          end
        end
        schema do
          property :int_participant do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :IntParticipantOutput do
      allOf do
        schema do
          key :'$ref', :IntParticipant
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :oas_researcher_id do
            key :type, :string
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

    swagger_schema :IntParticipantDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :IntParticipantOutput
            end
          end
        end
      end
    end

  end
end