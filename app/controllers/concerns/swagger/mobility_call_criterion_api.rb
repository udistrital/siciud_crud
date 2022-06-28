module Swagger::MobilityCallCriterionApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/mobility_call_criteria/{id}' do
      operation :get do
        key :summary, 'Get a Mobility Call Criterion by ID'
        key :description, 'Returns a single mobility Call criterion'
        key :operationId, :get_mobility_call_criterion_by_id
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls:: Evaluation']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of mobility Call criterion to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'mobility call criterion response'
          schema do
            key :'$ref', :MobilityCallCriterionOutput
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
        key :summary, 'Update mobility call criterion by ID'
        key :description, 'Returns the updated mobility call criterion'
        key :operationId, :update_mobility_call_criterion
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls:: Evaluation']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of mobility call criterion to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :mobility_call_criterion do
          key :in, :body
          key :description, 'mobility call criterion to update'
          key :required, true
          schema do
            key :'$ref', :MobilityCallCriterionInputPut
          end
        end

        response 200 do
          key :description, 'mobility call criterion response'
          schema do
            key :'$ref', :MobilityCallCriterionOutput
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
        key :summary, 'Update total, state or activate, deactivate a mobility call criterion by ID'
        key :description, 'Returns the activated/deactivated mobility call criterion'
        key :operationId, :change_active_mobility_call_criterion
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls:: Evaluation']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of mobility call criterion to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :mobility_call_criterion do
          key :in, :body
          key :description, 'mobility call criterion to activate, deactivate, or update total or state'
          key :required, true
          schema do
            property :mobility_call_criterion do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'mobility call criterion response'
          schema do
            key :'$ref', :MobilityCallCriterionOutput
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

    swagger_path '/mobility_calls/{mobility_call_id}/mobility_call_criteria' do
      operation :get do
        key :summary, 'Get all mobility call criteria by call'
        key :description, 'Returns all mobility call criteria by call'
        key :operationId, :get_mobility_calls_criteria_by_call
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls:: Evaluation']

        parameter name: :mobility_call_id do
          key :in, :path
          key :description, 'ID of mobility call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'mobility call criterion response'
          schema do
            key :type, :array
            items do
              key :'$ref', :MobilityCallCriterionDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new mobility call criteria'
        key :description, 'Returns the created mobility call criteria'
        key :operationId, :create_mobility_call_criteria
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls:: Evaluation']

        parameter name: :mobility_call_id do
          key :in, :path
          key :description, 'ID of mobility call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :mobility_call_criterion do
          key :in, :body
          key :description, 'mobility call criterion to register'
          key :required, true
          schema do
            key :'$ref', :MobilityCallCriterionInputPost
          end
        end

        response 201 do
          key :description, 'mobility call criterion response'
          schema do
            key :'$ref', :MobilityCallCriterionOutput
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