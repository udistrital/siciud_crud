module Swagger::CallEvalCriterionApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/call_eval_criteria/{id}' do
      operation :get do
        key :summary, 'Get a Call Evaluation Criterion by ID'
        key :description, 'Returns a single call evaluation criterion'
        key :operationId, :get_call_eval_criterion_by_id
        key :produces, ['application/json',]
        key :tags, ['Calls:: Call Evaluation Criteria']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of call eval criterion to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'call eval criterion response'
          schema do
            key :'$ref', :CallEvalCriterionOutput
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
        key :summary, 'Update call eval criterion by ID'
        key :description, 'Returns the updated call eval criterion'
        key :operationId, :update_call_eval_criterion
        key :produces, ['application/json',]
        key :tags, ['Calls:: Call Evaluation Criteria']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of call eval criterion to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call_eval_criterion do
          key :in, :body
          key :description, 'call eval criterion to update'
          key :required, true
          schema do
            key :'$ref', :CallEvalCriterionInputPut
          end
        end

        response 200 do
          key :description, 'call eval criterion response'
          schema do
            key :'$ref', :CallEvalCriterionOutput
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
        key :summary, 'Activate or deactivate a call eval criterion by ID'
        key :description, 'Returns the activated/deactivated call eval criterion'
        key :operationId, :change_active_call_eval_criterion
        key :produces, ['application/json',]
        key :tags, ['Calls:: Call Evaluation Criteria']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of call eval criterion to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call_eval_criterion do
          key :in, :body
          key :description, 'call eval criterion to activate or deactivate'
          key :required, true
          schema do
            property :call_eval_criterion do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'call eval criterion response'
          schema do
            key :'$ref', :CallEvalCriterionOutput
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

    swagger_path '/calls/{call_id}/call_eval_criteria' do
      operation :get do
        key :summary, 'Get all call eval criteria'
        key :description, 'Returns all call eval criteria'
        key :operationId, :get_call_eval_criteria
        key :produces, ['application/json',]
        key :tags, ['Calls:: Call Evaluation Criteria']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'call eval criterion response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CallEvalCriterionDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new call eval criterion'
        key :description, 'Returns the created call eval criterion'
        key :operationId, :create_call_eval_criterion
        key :produces, ['application/json',]
        key :tags, ['Calls:: Call Evaluation Criteria']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call_eval_criterion do
          key :in, :body
          key :description, 'call eval criterion to register'
          key :required, true
          schema do
            key :'$ref', :CallEvalCriterionInputPost
          end
        end

        response 201 do
          key :description, 'call eval criterion response'
          schema do
            key :'$ref', :CallEvalCriterionOutput
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