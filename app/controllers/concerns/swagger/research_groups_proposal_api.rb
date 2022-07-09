module Swagger::ResearchGroupsProposalApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_groups_proposals/{id}' do
      operation :get do
        key :summary, 'Get a research unit by ID'
        key :description, 'Returns a single research unit of a proposal'
        key :operationId, :get_research_groups_proposal_by_id
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Research Units']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research unit of a proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'research unit response'
          schema do
            key :'$ref', :ResearchGroupsProposalOutput
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
        key :summary, 'Update research unit by ID'
        key :description, 'Returns the updated research unit of a proposal'
        key :operationId, :update_research_groups_proposal
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Research Units']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research unit of a proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :research_groups_proposal do
          key :in, :body
          key :description, 'research unit of a proposal to update'
          key :required, true
          schema do
            key :'$ref', :ResearchGroupsProposalInputPut
          end
        end

        response 200 do
          key :description, 'research unit response'
          schema do
            key :'$ref', :ResearchGroupsProposalOutput
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
        key :summary, 'Activate or deactivate a research unit of a proposal by ID'
        key :description, 'Returns the activated/deactivated research unit of a proposal'
        key :operationId, :change_active_research_groups_proposal
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Research Units']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research unit of a proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :research_groups_proposal do
          key :in, :body
          key :description, 'research unit of a proposal to activate or deactivate'
          key :required, true
          schema do
            property :research_groups_proposal do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'research unit response'
          schema do
            key :'$ref', :ResearchGroupsProposalOutput
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

    swagger_path '/proposals/{proposal_id}/research_groups_proposals' do
      operation :get do
        key :summary, 'Get all research units of a proposals'
        key :description, 'Returns all research units of a proposals'
        key :operationId, :get_research_groups_proposals
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Research Units']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'research unit response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ResearchGroupsProposalDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Add a research unit to a proposal'
        key :description, 'Returns the added research unit to a proposal'
        key :operationId, :create_research_groups_proposal
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Research Units']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :research_groups_proposal do
          key :in, :body
          key :description, 'research unit of a proposal to register'
          key :required, true
          schema do
            key :'$ref', :ResearchGroupsProposalInputPost
          end
        end

        response 201 do
          key :description, 'research unit response'
          schema do
            key :'$ref', :ResearchGroupsProposalOutput
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