module Swagger::ActionPlanApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/action_plans/{id}' do
      operation :get do
        key :summary, 'Get a Action Plan by ID'
        key :description, 'Returns a single Action Plan'
        key :operationId, :get_action_plan_by_id
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Action Plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'action plan response'
          schema do
            key :'$ref', :ActionPlanOutput
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
        key :summary, 'Update Action Plan by ID'
        key :description, 'Return the updated Action Plan'
        key :operationId, :update_action_plan
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Action Plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :action_plan do
          key :in, :body
          key :description, 'Action Plan to update'
          key :required, true
          schema do
            key :'$ref', :ActionPlanInputPut
          end
        end

        response 200 do
          key :description, 'action plan response'
          schema do
            key :'$ref', :ActionPlanOutput
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
        key :summary, 'Activate or deactivate a Action Plan by ID'
        key :description, 'Returns the activated/deactivated Action Plan'
        key :operationId, :change_active_action_plan
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Action Plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :action_plan do
          key :in, :body
          key :description, 'Action Plan to activate or deactivate'
          key :required, true
          schema do
            property :action_plan do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'action plan response'
          schema do
            key :'$ref', :ActionPlanOutput
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

    swagger_path '/research_units/{research_group_id}/action_plans' do
      operation :get do
        key :summary, 'Get all Action Plans of a research unit'
        key :description, 'Returns all Action Plans of a research unit'
        key :operationId, :get_action_plans
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'action plan response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ActionPlanDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Action Plan'
        key :description, 'Returns the created Action Plan'
        key :operationId, :create_action_plan
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :action_plan do
          key :in, :body
          key :description, 'Action Plan to register'
          key :required, true
          schema do
            key :'$ref', :ActionPlanInputPost
          end
        end

        response 201 do
          key :description, 'action plan response'
          schema do
            key :'$ref', :ActionPlanOutput
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

    swagger_path '/action_plans' do
      operation :get do
        key :summary, 'Get all Action Plans'
        key :description, 'Returns all Action Plans'
        key :operationId, :get_admin_action_plans
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans']

        response 200 do
          key :description, 'action plan response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ActionPlanDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end

    swagger_path '/action_plans_print/{action_plan_id}' do
      operation :get do
        key :summary, 'Get a Action Plan Print View'
        key :description, 'Returns action plan print view with the forms.'
        key :operationId, :get_action_plans_print
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'action plan response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ActionPlanDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end
  end
end