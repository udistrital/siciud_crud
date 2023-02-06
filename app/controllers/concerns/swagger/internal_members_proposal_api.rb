module Swagger::InternalMembersProposalApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/internal_members_proposals/{id}' do
      operation :get do
        key :summary, 'Get a Internal members proposal by ID'
        key :description, 'Returns a single internal members proposal'
        key :operationId, :get_internal_members_proposal_by_id
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Internal Members Proposals']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of internal members proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'internal members proposal response'
          schema do
            key :'$ref', :InternalMembersProposalOutput
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
        key :summary, 'Update Internal members proposal by ID'
        key :description, 'Returns the updated internal members proposal'
        key :operationId, :update_internal_members_proposal
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Internal Members Proposals']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of internal members proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :internal_members_proposal do
          key :in, :body
          key :description, 'Internal members proposal to update'
          key :required, true
          schema do
            key :'$ref', :InternalMembersProposalInputPut
          end
        end

        response 200 do
          key :description, 'internal members proposal response'
          schema do
            key :'$ref', :InternalMembersProposalOutput
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
        key :summary, 'Activate or deactivate a Internal members proposal by ID'
        key :description, 'Returns the activated/deactivated internal members proposal'
        key :operationId, :change_active_internal_members_proposal
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Internal Members Proposals']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of internal members proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :internal_members_proposal do
          key :in, :body
          key :description, 'Internal members proposal to activate or deactivate'
          key :required, true
          schema do
            property :internal_members_proposal do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'internal members proposal response'
          schema do
            key :'$ref', :InternalMembersProposalOutput
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

    swagger_path '/proposals/{proposal_id}/internal_members_proposals' do
      operation :get do
        key :summary, 'Get all Internal members proposals'
        key :description, 'Returns all internal members proposals'
        key :operationId, :get_internal_members_proposals
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Internal Members Proposals']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'internal members proposal response'
          schema do
            key :'$ref', :InternalMembersProposalDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Internal members proposal'
        key :description, 'Returns the created internal members proposal'
        key :operationId, :create_internal_members_proposal
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Internal Members Proposals']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :internal_members_proposal do
          key :in, :body
          key :description, 'Internal members proposal to register'
          key :required, true
          schema do
            key :'$ref', :InternalMembersProposalInputPost
          end
        end

        response 201 do
          key :description, 'internal members proposal response'
          schema do
            key :'$ref', :InternalMembersProposalOutput
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