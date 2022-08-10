module Swagger::ProposalBudgetApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/proposal_budgets/{id}' do
      operation :get do
        key :summary, 'Get a proposal budget by ID'
        key :description, 'Returns a single proposal budget'
        key :operationId, :get_proposal_budget_by_id
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Proposal budgets']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of proposal budget to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'proposal budget response'
          schema do
            key :'$ref', :ProposalBudgetOutput
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
        key :summary, 'Update proposal budget by ID'
        key :description, 'Returns the updated proposal budget'
        key :operationId, :update_proposal_budget
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Proposal budgets']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of proposal budget to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :proposal_budget do
          key :in, :body
          key :description, 'Proposal budget to update'
          key :required, true
          schema do
            key :'$ref', :ProposalBudgetInputPut
          end
        end

        response 200 do
          key :description, 'proposal budget response'
          schema do
            key :'$ref', :ProposalBudgetOutput
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
        key :summary, 'Activate or deactivate a proposal budget by ID'
        key :description, 'Returns the activated/deactivated proposal budget'
        key :operationId, :change_active_proposal_budget
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Proposal budgets']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of proposal budget to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :proposal_budget do
          key :in, :body
          key :description, 'Proposal budget to activate or deactivate'
          key :required, true
          schema do
            property :proposal_budget do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'proposal budget response'
          schema do
            key :'$ref', :ProposalBudgetOutput
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

    swagger_path '/proposals/{proposal_id}/proposal_budgets' do
      operation :get do
        key :summary, 'Get all  proposal budgets'
        key :description, 'Returns all proposal budgets'
        key :operationId, :get_proposal_budgets
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Proposal budgets']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'proposal budget response'
          schema do
            key :'$ref', :ProposalBudgetDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new proposal budget'
        key :description, 'Returns the created proposal budget'
        key :operationId, :create_proposal_budget
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Proposal budgets']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :proposal_budget do
          key :in, :body
          key :description, 'Proposal budget to register'
          key :required, true
          schema do
            key :'$ref', :ProposalBudgetInputPost
          end
        end

        response 201 do
          key :description, 'proposal budget response'
          schema do
            key :'$ref', :ProposalBudgetOutput
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