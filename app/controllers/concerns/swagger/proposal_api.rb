module Swagger::ProposalApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do

    swagger_path '/proposals' do
      operation :get do
        key :summary, 'Get all Proposals'
        key :description, 'Returns all proposals'
        key :operationId, :get_proposals
        key :produces, ['application/json',]
        key :tags, ['Proposals/Projects']

        parameter name: :skip do
          key :in, :query
          key :description, 'page number, start at 0'
          key :required, false
          key :type, :integer
          key :format, :int64
          key :example, 0
        end

        parameter name: :take do
          key :in, :query
          key :description, 'number of records per page'
          key :required, false
          key :type, :integer
          key :format, :int64
          key :example, 10
        end

        response 200 do
          key :description, 'proposal response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ProposalDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end

    swagger_path '/proposals/{id}' do
      operation :get do
        key :summary, 'Get a Proposal by ID'
        key :description, 'Returns a single proposal'
        key :operationId, :get_proposal_by_id
        key :produces, ['application/json',]
        key :tags, ['Proposals/Projects']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'proposal response'
          schema do
            key :'$ref', :ProposalOutput
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
        key :summary, 'Update Proposal by ID'
        key :description, 'Returns the updated proposal'
        key :operationId, :update_proposal
        key :produces, ['application/json',]
        key :tags, ['Proposals/Projects']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :proposal do
          key :in, :body
          key :description, 'Proposal to update'
          key :required, true
          schema do
            key :'$ref', :ProposalInputPut
          end
        end

        response 200 do
          key :description, 'proposal response'
          schema do
            key :'$ref', :ProposalOutput
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
        key :summary, 'Activate or deactivate a Proposal by ID'
        key :description, 'Returns the activated/deactivated proposal'
        key :operationId, :change_active_proposal
        key :produces, ['application/json',]
        key :tags, ['Proposals/Projects']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :proposal do
          key :in, :body
          key :description, 'Proposal to activate or deactivate'
          key :required, true
          schema do
            property :proposal do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'proposal response'
          schema do
            key :'$ref', :ProposalOutput
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

    swagger_path '/calls/{call_id}/proposals' do
      operation :get do
        key :summary, 'Get all Proposals of a Call'
        key :description, 'Returns all proposals of a Call by call_id'
        key :operationId, :get_proposals_by_call
        key :produces, ['application/json',]
        key :tags, ['Proposals/Projects']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'proposal response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ProposalDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Proposal'
        key :description, 'Returns the created proposal'
        key :operationId, :create_proposal
        key :produces, ['application/json',]
        key :tags, ['Proposals/Projects']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :proposal do
          key :in, :body
          key :description, 'Proposal to register'
          key :required, true
          schema do
            key :'$ref', :ProposalInputPost
          end
        end

        response 201 do
          key :description, 'proposal response'
          schema do
            key :'$ref', :ProposalOutput
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