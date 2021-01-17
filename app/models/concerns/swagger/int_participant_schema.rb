module Swagger::IntParticipantSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :IntParticipant do
      key :required, [:id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :participant_type_id do
        key :type, :integer
        key :format, :int64
      end
      property  :producible_id do
        key :type, :integer
        key :format, :int64
      end
      property  :producible_type do
        key :type, :string
      end
      property  :researcher_id do
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

    swagger_schema :IntParticipantInput do
      property :int_participant do
        property :participant_type_id do
          key :type, :integer
          key :format, :int64
        end
        property  :researcher_id do
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

    swagger_schema :IntParticipantOutput do
      allOf do
        schema do
          key :'$ref', :IntParticipant
        end
      end
    end
  end
end