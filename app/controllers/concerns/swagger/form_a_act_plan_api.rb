module Swagger::FormAActPlanApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/form_a_act_plans/{id}' do
      operation :get do
        key :summary, 'Get a Form A action plan by ID'
        key :description, 'Returns a single form A action plan'
        key :operationId, :get_form_a_act_plan_by_id
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form A']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of form A action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'form A action plan response'
          schema do
            key :'$ref', :FormAActPlanOutput
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
    end

    swagger_path '/action_plans/{action_plan_id}/form_a_act_plans/{id}' do
      operation :put do
        key :summary, 'Update Form A action plan by ID'
        key :description, 'Returns the updated form A action plan'
        key :operationId, :update_form_a_act_plan
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form A']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of form A action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :form_a_act_plan do
          key :in, :body
          key :description, 'Form A action plan to update'
          key :required, true
          schema do
            key :'$ref', :FormAActPlanInputPut
          end
        end

        response 200 do
          key :description, 'form A action plan response'
          schema do
            key :'$ref', :FormAActPlanOutput
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
        key :summary, 'Activate or deactivate a Form A action plan by ID'
        key :description, 'Returns the activated/deactivated form A action plan'
        key :operationId, :change_active_form_a_act_plan
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form A']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of form A action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :form_a_act_plan do
          key :in, :body
          key :description, 'Form A action plan to activate or deactivate'
          key :required, true
          schema do
            property :form_a_act_plan do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'form A action plan response'
          schema do
            key :'$ref', :FormAActPlanOutput
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

    swagger_path '/action_plans/{action_plan_id}/form_a_act_plans' do
      operation :get do
        key :summary, 'Get all Form A action plans'
        key :description, 'Returns all form A action plans'
        key :operationId, :get_form_a_act_plans
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form A']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'form A action plan response'
          schema do
            key :type, :array
            items do
              key :'$ref', :FormAActPlanDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Form A action plan'
        key :description, 'Returns the created form A action plan'
        key :operationId, :create_form_a_act_plan
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form A']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :form_a_act_plan do
          key :in, :body
          key :description, 'Form A action plan to register'
          key :required, true
          schema do
            key :'$ref', :FormAActPlanInputPost
          end
        end

        response 201 do
          key :description, 'form A action plan response'
          schema do
            key :'$ref', :FormAActPlanOutput
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