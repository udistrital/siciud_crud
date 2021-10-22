module Swagger::FormBActPlanApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/form_b_act_plans/{id}' do
      operation :get do
        key :summary, 'Get a Form B action plan by ID'
        key :description, 'Returns a single form B action plan'
        key :operationId, :get_form_b_act_plan_by_id
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form B']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of form B action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'form B action plan response'
          schema do
            key :'$ref', :FormBActPlanOutput
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

    swagger_path '/action_plans/{action_plan_id}/form_b_act_plans/{id}' do
      operation :put do
        key :summary, 'Update Form B action plan by ID'
        key :description, 'Returns the updated form B action plan'
        key :operationId, :update_form_b_act_plan
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form B']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of form B action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :form_b_act_plan do
          key :in, :body
          key :description, 'Form B action plan to update'
          key :required, true
          schema do
            key :'$ref', :FormBActPlanInputPut
          end
        end

        response 200 do
          key :description, 'form B action plan response'
          schema do
            key :'$ref', :FormBActPlanOutput
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
        key :summary, 'Activate or deactivate a Form B action plan by ID'
        key :description, 'Returns the activated/deactivated form B action plan'
        key :operationId, :change_active_form_b_act_plan
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form B']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of form B action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :form_b_act_plan do
          key :in, :body
          key :description, 'Form B action plan to activate or deactivate'
          key :required, true
          schema do
            property :form_b_act_plan do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'form B action plan response'
          schema do
            key :'$ref', :FormBActPlanOutput
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

    swagger_path '/action_plans/{action_plan_id}/form_b_act_plans' do
      operation :get do
        key :summary, 'Get all Form B action plans'
        key :description, 'Returns all form B action plans'
        key :operationId, :get_form_b_act_plans
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form B']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'form B action plan response'
          schema do
            key :type, :array
            items do
              key :'$ref', :FormBActPlanDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Form B action plan'
        key :description, 'Returns the created form B action plan'
        key :operationId, :create_form_b_act_plan
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form B']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :form_b_act_plan do
          key :in, :body
          key :description, 'Form B action plan to register'
          key :required, true
          schema do
            key :'$ref', :FormBActPlanInputPost
          end
        end

        response 201 do
          key :description, 'form B action plan response'
          schema do
            key :'$ref', :FormBActPlanOutput
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