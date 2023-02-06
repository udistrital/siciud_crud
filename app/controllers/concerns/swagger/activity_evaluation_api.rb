module Swagger::ActivityEvaluationApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/activity_evaluations/{id}' do
      operation :get do
        key :summary, 'Get an activity evaluation by ID'
        key :description, 'Returns a single activity evaluation'
        key :operationId, :get_activity_evaluation_by_id
        key :produces, ['application/json',]
        key :tags, ['Projects:: Activity Evaluations']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of activity evaluation to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'activity evaluation response'
          schema do
            key :'$ref', :ActivityEvaluationOutput
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
        key :summary, 'Update activity evaluation by ID'
        key :description, 'Returns the updated activity evaluation'
        key :operationId, :update_activity_evaluation
        key :produces, ['application/json',]
        key :tags, ['Projects:: Activity Evaluations']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of activity evaluation to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :activity_evaluation do
          key :in, :body
          key :description, 'activity evaluation to update'
          key :required, true
          schema do
            key :'$ref', :ActivityEvaluationInputPut
          end
        end

        response 200 do
          key :description, 'activity evaluation response'
          schema do
            key :'$ref', :ActivityEvaluationOutput
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
        key :summary, 'Activate or deactivate an activity evaluation by ID'
        key :description, 'Returns the activated/deactivated activity evaluation'
        key :operationId, :change_active_activity_evaluation
        key :produces, ['application/json',]
        key :tags, ['Projects:: Activity Evaluations']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of activity evaluation to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :activity_evaluation do
          key :in, :body
          key :description, 'activity evaluation to activate or deactivate'
          key :required, true
          schema do
            property :activity_evaluation do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'activity evaluation response'
          schema do
            key :'$ref', :ActivityEvaluationOutput
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

    swagger_path '/proposals/{proposal_id}/activity_evaluations' do
      operation :get do
        key :summary, 'Get all activity evaluations by proposal'
        key :description, 'Returns all activity evaluations by proposal'
        key :operationId, :get_activity_evaluations
        key :produces, ['application/json',]
        key :tags, ['Projects:: Activity Evaluations']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'activity evaluation response'
          schema do
            key :'$ref', :ActivityEvaluationDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end

    swagger_path '/activity_schedules/{activity_schedule_id}/activity_evaluations' do
      operation :post do
        key :summary, 'Create a new activity evaluation'
        key :description, 'Returns the created activity evaluation'
        key :operationId, :create_activity_evaluation
        key :produces, ['application/json',]
        key :tags, ['Projects:: Activity Evaluations']

        parameter name: :activity_schedule_id do
          key :in, :path
          key :description, 'ID of activity schedule to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :activity_evaluation do
          key :in, :body
          key :description, 'ActivityEvaluation to register'
          key :required, true
          schema do
            key :'$ref', :ActivityEvaluationInputPost
          end
        end

        response 201 do
          key :description, 'activity evaluation response'
          schema do
            key :'$ref', :ActivityEvaluationOutput
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