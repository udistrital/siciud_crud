module Swagger::GroupMemberSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :GroupMember do
      key :required, [:id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :role_id do
        key :type, :integer
        key :format, :int64
      end
      property :researcher_id do
        key :type, :integer
        key :format, :int64
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :gm_state_id do
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

    swagger_schema :GroupMemberInput do
      property :group_member do
        property :gm_state_id do
          key :type, :integer
          key :format, :int64
        end
        property :role_id do
          key :type, :integer
          key :format, :int64
        end
        property :researcher_id do
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

    swagger_schema :GroupMemberOutput do
      allOf do
        schema do
          key :'$ref', :GroupMember
        end
        schema do
          property :parent_id do
            key :type, :integer
            key :format, :int64
          end
          property :role_type_id do
            key :type, :integer
            key :format, :int64
          end
        end
      end
    end
  end
end
