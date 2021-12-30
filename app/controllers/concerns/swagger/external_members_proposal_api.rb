module Swagger::ExternalMembersProposalApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/external_members_proposals/{id}' do
      operation :get do
        key :summary, 'Get a External Members Proposal by ID'
        key :description, 'Returns a single external Members Proposal'
        key :operationId, :get_external_members_proposal_by_id
        key :produces, ['application/json',]
        key :tags, ['Proposals:: External Members Proposals']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of external members proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'external members proposal response'
          schema do
            key :'$ref', :ExternalMembersProposalOutput
          end
        end
        response 404 do
          key :description, 'Not Found'
          schema do
            key :'$ref', :ErrorNotFound
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :put do
        key :summary, 'Update External Members Proposal by ID'
        key :description, 'Returns the updated external Members Proposal'
        key :operationId, :update_external_members_proposal
        key :produces, ['application/json',]
        key :tags, ['Proposals:: External Members Proposals']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of external members proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :external_members_proposal do
          key :in, :body
          key :description, 'external members proposal to update'
          key :required, true
          schema do
            key :'$ref', :ExternalMembersProposalInputPut
          end
        end

        response 200 do
          key :description, 'external members proposal response'
          schema do
            key :'$ref', :ExternalMembersProposalOutput
          end
        end
        response 422 do
          key :description, 'Unprocessable Entity'
          schema do
            key :'$ref', :ErrorUnprocessableEntity
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :patch do
        key :summary, 'Activate or deactivate a External Members Proposal by ID'
        key :description, 'Returns the activated/deactivated external Members Proposal'
        key :operationId, :change_active_external_members_proposal
        key :produces, ['application/json',]
        key :tags, ['Proposals:: External Members Proposals']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of external members proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :external_members_proposal do
          key :in, :body
          key :description, 'External members proposal to activate or deactivate'
          key :required, true
          schema do
            property :external_members_proposal do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'external members proposal response'
          schema do
            key :'$ref', :ExternalMembersProposalOutput
          end
        end
        response 422 do
          key :description, 'Unprocessable Entity'
          schema do
            key :'$ref', :ErrorUnprocessableEntity
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end

    swagger_path '/proposals/{proposal_id}/external_members_proposals' do
      operation :get do
        key :summary, 'Get all External Members Proposals'
        key :description, 'Returns all external Members Proposals'
        key :operationId, :get_external_members_proposals
        key :produces, ['application/json',]
        key :tags, ['Proposals:: External Members Proposals']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'external members proposal response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ExternalMembersProposalDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new External Members Proposal'
        key :description, 'Returns the created external Members Proposal'
        key :operationId, :create_external_members_proposal
        key :produces, ['application/json',]
        key :tags, ['Proposals:: External Members Proposals']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :external_members_proposal do
          key :in, :body
          key :description, 'External Members Proposal to register'
          key :required, true
          schema do
            key :'$ref', :ExternalMembersProposalInputPost
          end
        end

        response 201 do
          key :description, 'external members proposal response'
          schema do
            key :'$ref', :ExternalMembersProposalOutput
          end
        end
        response 422 do
          key :description, 'Unprocessable Entity'
          schema do
            key :'$ref', :ErrorUnprocessableEntity
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end
  end
end