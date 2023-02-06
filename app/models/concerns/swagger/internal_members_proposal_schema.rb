module Swagger::InternalMembersProposalSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :InternalMembersProposal do
      property :role_id do
        key :type, :integer
        key :format, :int64
      end
      property :start_date do
        key :type, :string
        key :format, :date
      end
      property :end_date do
        key :type, :string
        key :format, :date
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :InternalMembersProposalInputPost do
      allOf do
        schema do
          property :internal_members_proposal do
            key :'$ref', :InternalMembersProposal
          end
        end
        schema do
          property :internal_members_proposal do
            property :researcher_id do
              key :type, :integer
              key :format, :int64
            end
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :InternalMembersProposalInputPut do
      allOf do
        schema do
          property :internal_members_proposal do
            key :'$ref', :InternalMembersProposal
          end
        end
        schema do
          property :internal_members_proposal do
            property :proposal_id do
              key :type, :integer
              key :format, :int64
            end
            property :researcher_id do
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

    swagger_schema :InternalMembersProposalOutput do
      allOf do
        schema do
          key :'$ref', :InternalMembersProposal
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
          property :role_name do
            key :type, :string
          end
          property :researcher do
            key :type, :object
            property :id do
              key :type, :integer
              key :format, :int64
            end
            property :identification_number do
              key :type, :string
            end
            property :orcid_id do
              key :type, :string
            end
            property :mobile_number_one do
              key :type, :string
            end
            property :mobile_number_two do
              key :type, :string
            end
            property :phone_number_one do
              key :type, :string
            end
            property :phone_number_two do
              key :type, :string
            end
            property :address do
              key :type, :string
            end
            property :oas_researcher_id do
              key :type, :string
            end
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

    swagger_schema :InternalMembersProposalDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :InternalMembersProposalOutput
            end
          end
        end
      end
    end
  end
end