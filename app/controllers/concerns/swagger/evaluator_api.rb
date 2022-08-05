module Swagger::EvaluatorApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/evaluators/{id}' do
      operation :get do
        key :summary, 'Get a Evaluator by ID'
        key :description, 'Returns a single evaluator'
        key :operationId, :get_evaluator_by_id
        key :produces, ['application/json',]
        key :tags, ['Evaluators']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of evaluator to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'evaluator response'
          schema do
            key :'$ref', :EvaluatorOutput
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
        key :summary, 'Update Evaluator by ID'
        key :description, 'Returns the updated evaluator'
        key :operationId, :update_evaluator
        key :produces, ['application/json',]
        key :tags, ['Evaluators']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of evaluator to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :evaluator do
          key :in, :body
          key :description, 'Evaluator to update'
          key :required, true
          schema do
            key :'$ref', :EvaluatorInputPut
          end
        end

        response 200 do
          key :description, 'evaluator response'
          schema do
            key :'$ref', :EvaluatorOutput
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
        key :summary, 'Activate or deactivate a evaluator by ID'
        key :description, 'Returns the activated/deactivated evaluator'
        key :operationId, :change_active_evaluator
        key :produces, ['application/json',]
        key :tags, ['Evaluators']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of evaluator to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :evaluator do
          key :in, :body
          key :description, 'evaluator to activate or deactivate'
          key :required, true
          schema do
            property :evaluator do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'evaluator response'
          schema do
            key :'$ref', :EvaluatorOutput
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

    swagger_path '/evaluators' do
      operation :get do
        key :summary, 'Get all Evaluators'
        key :description, 'Returns all evaluators'
        key :operationId, :get_evaluators
        key :produces, ['application/json',]
        key :tags, ['Evaluators']

        parameter name: :email do
          key :in, :query
          key :description, 'evaluator email to fetch'
          key :required, false
          key :type, :string
        end

        response 200 do
          key :description, 'evaluator response'
          schema do
            key :'$ref', :EvaluatorDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Evaluator'
        key :description, 'Returns the created evaluator'
        key :operationId, :create_evaluator
        key :produces, ['application/json',]
        key :tags, ['Evaluators']

        parameter name: :evaluator do
          key :in, :body
          key :description, 'Evaluator to register'
          key :required, true
          schema do
            key :'$ref', :EvaluatorInputPost
          end
        end

        response 201 do
          key :description, 'evaluator response'
          schema do
            key :'$ref', :EvaluatorOutput
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

    swagger_path '/proposals/{proposal_id}/evaluators' do
      operation :get do
        key :summary, 'Get all evaluators filtered by proposal'
        key :description, 'Returns all evaluators filtered by proposal id'
        key :operationId, :get_evaluators_by_proposal
        key :produces, ['application/json',]
        key :tags, ['Evaluators']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'objective response'
          schema do
            key :'$ref', :EvaluatorDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end
  end
end