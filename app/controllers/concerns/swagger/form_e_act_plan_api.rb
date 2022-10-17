module Swagger::FormEActPlanApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/form_e_act_plans/{id}' do
      operation :get do
        key :summary, 'Get a Form E action plan by ID'
        key :description, 'Returns a single form E action plan'
        key :operationId, :get_form_e_act_plan_by_id
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form E']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of form E action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'form e action plan response'
          schema do
            key :'$ref', :FormEActPlanOutput
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

    swagger_path '/action_plans/{action_plan_id}/form_e_act_plans/{id}' do
      operation :put do
        key :summary, 'Update Form E action plan by ID'
        key :description, 'Returns the updated form E action plan'
        key :operationId, :update_form_e_act_plan
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form E']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of form E action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :form_e_act_plan do
          key :in, :body
          key :description, 'Form E action plan to update'
          key :required, true
          schema do
            key :'$ref', :FormEActPlanInputPut
          end
        end

        response 200 do
          key :description, 'form e action plan response'
          schema do
            key :'$ref', :FormEActPlanOutput
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
        key :summary, 'Activate or deactivate a Form E action plan by ID'
        key :description, 'Returns the activated/deactivated form E action plan'
        key :operationId, :change_active_form_e_act_plan
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form E']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of form E action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :form_e_act_plan do
          key :in, :body
          key :description, 'Form E action plan to activate or deactivate'
          key :required, true
          schema do
            property :form_e_act_plan do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'form e action plan response'
          schema do
            key :'$ref', :FormEActPlanOutput
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

    swagger_path '/inventories/{id}' do
      operation :put do
        key :summary, 'Update Form E action plan or inventory by ID'
        key :description, 'Returns the updated form E action plan or inventory'
        key :operationId, :update_inventory
        key :produces, ['application/json',]
        key :tags, ['Projects::Inventories']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of form E action plan or inventory to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :form_e_act_plan do
          key :in, :body
          key :description, 'Form E action plan or inventory to update'
          key :required, true
          schema do
            key :'$ref', :FormEActPlanInputPut
          end
        end

        response 200 do
          key :description, 'form e action plan or inventory response'
          schema do
            key :'$ref', :FormEActPlanOutput
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
        key :summary, 'Activate or deactivate a Form E action plan or inventory by ID'
        key :description, 'Returns the activated/deactivated form E action plan or inventory'
        key :operationId, :change_active_inventory
        key :produces, ['application/json',]
        key :tags, ['Projects::Inventories']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of form E action plan or inventory to fetch '
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :form_e_act_plan do
          key :in, :body
          key :description, 'Form E action plan or inventory to activate or deactivate'
          key :required, true
          schema do
            property :form_e_act_plan do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'form e action plan or inventory response'
          schema do
            key :'$ref', :FormEActPlanOutput
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

    swagger_path '/action_plans/{action_plan_id}/form_e_act_plans' do
      operation :get do
        key :summary, 'Get all Form E action plans'
        key :description, 'Returns all form E action plans'
        key :operationId, :get_form_e_act_plans
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form E']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'form e action plan response'
          schema do
            key :type, :array
            items do
              key :'$ref', :FormEActPlanDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Form E action plan'
        key :description, 'Returns the created form E action plan'
        key :operationId, :create_form_e_act_plan
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans::Form E']

        parameter name: :action_plan_id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :form_e_act_plan do
          key :in, :body
          key :description, 'Form E action plan to register'
          key :required, true
          schema do
            key :'$ref', :FormEActPlanInputPost
          end
        end

        response 201 do
          key :description, 'form e action plan response'
          schema do
            key :'$ref', :FormEActPlanOutput
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