module Swagger::ObjectiveApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/objectives/{id}' do
      operation :get do
        key :summary, 'Get a objective by ID'
        key :description, 'Returns a single objective'
        key :operationId, :get_objective_by_id
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Objectives']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of objective to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'objective response'
          schema do
            key :'$ref', :ObjectiveOutput
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
        key :summary, 'Update objective by ID'
        key :description, 'Returns the updated objective'
        key :operationId, :update_objective
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Objectives']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of objective to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :objective do
          key :in, :body
          key :description, 'Objective to update'
          key :required, true
          schema do
            key :'$ref', :ObjectiveInputPut
          end
        end

        response 200 do
          key :description, 'objective response'
          schema do
            key :'$ref', :ObjectiveOutput
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
        key :summary, 'Activate or deactivate a Objective by ID'
        key :description, 'Returns the activated/deactivated objective'
        key :operationId, :change_active_objective
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Objectives']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of objective to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :objective do
          key :in, :body
          key :description, 'Objective to activate or deactivate'
          key :required, true
          schema do
            property :objective do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'objective response'
          schema do
            key :'$ref', :ObjectiveOutput
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

    swagger_path '/proposals/{proposal_id}/objectives' do
      operation :get do
        key :summary, 'Get all Objectives'
        key :description, 'Returns all objectives'
        key :operationId, :get_objectives
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Objectives']

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
            key :'$ref', :ObjectiveDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Objective'
        key :description, 'Returns the created objective'
        key :operationId, :create_objective
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Objectives']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :objective do
          key :in, :body
          key :description, 'Objective to register'
          key :required, true
          schema do
            key :'$ref', :ObjectiveInputPost
          end
        end

        response 201 do
          key :description, 'objective response'
          schema do
            key :'$ref', :ObjectiveOutput
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