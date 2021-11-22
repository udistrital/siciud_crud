module Swagger::ExternalMembersProposalSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ExternalMembersProposal do
      property :contact_id do
        key :type, :integer
        key :format, :int64
      end
      property :proposal_id do
        key :type, :integer
        key :format, :int64
      end
      property :role_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ExternalMembersProposalInputPost do
      allOf do
        schema do
          property :external_members_proposal do
            key :'$ref', :ExternalMembersProposal
          end
        end
        schema do
          property :external_members_proposal do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ExternalMembersProposalInputPut do
      allOf do
        schema do
          property :external_members_proposal do
            key :'$ref', :ExternalMembersProposal
          end
        end
        schema do
          property :external_members_proposal do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ExternalMembersProposalOutput do
      allOf do
        schema do
          key :'$ref', :ExternalMembersProposal
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :contact do
            key :type, :object
            property :name do
              key :type, :string
            end
            property :email do
              key :type, :string
            end
            property :identification_number do
              key :type, :string
            end
            property :identification_type_id do
              key :type, :integer
              key :format, :int64
            end
            property :phone do
              key :type, :string
            end
            property :mobile do
              key :type, :string
            end
            property :address do
              key :type, :string
            end
          end
          property :role_name do
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

    swagger_schema :ExternalMembersProposalDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ExternalMembersProposalOutput
            end
          end
        end
      end
    end
  end
end