module Swagger::MobilityCallApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/mobility_calls/{id}' do
      operation :get do
        key :summary, 'Get a Mobility Call by ID'
        key :description, 'Returns a single mobility Call'
        key :operationId, :get_call_item_by_id
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of mobility Call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'mobility call response'
          schema do
            key :'$ref', :MobilityCallOutput
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
        key :summary, 'Update mobility call by ID'
        key :description, 'Returns the updated mobility call'
        key :operationId, :update_call_item
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of mobility call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call_item do
          key :in, :body
          key :description, 'mobility call to update'
          key :required, true
          schema do
            key :'$ref', :MobilityCallInputPut
          end
        end

        response 200 do
          key :description, 'mobility call response'
          schema do
            key :'$ref', :MobilityCallOutput
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
        key :summary, 'Activate or deactivate a mobility call by ID'
        key :description, 'Returns the activated/deactivated mobility call'
        key :operationId, :change_active_call_item
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of mobility call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call_item do
          key :in, :body
          key :description, 'mobility call to activate or deactivate'
          key :required, true
          schema do
            property :call_item do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'mobility call response'
          schema do
            key :'$ref', :MobilityCallOutput
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

    swagger_path '/calls/{call_id}/mobility_calls' do
      operation :get do
        key :summary, 'Get all mobility calls by call'
        key :description, 'Returns all mobility calls by call'
        key :operationId, :get_mobility_calls_by_call
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'mobility call response'
          schema do
            key :type, :array
            items do
              key :'$ref', :MobilityCallDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new mobility call'
        key :description, 'Returns the created mobility call'
        key :operationId, :create_call_item
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call_item do
          key :in, :body
          key :description, 'mobility call to register'
          key :required, true
          schema do
            key :'$ref', :MobilityCallInputPost
          end
        end

        response 201 do
          key :description, 'mobility call response'
          schema do
            key :'$ref', :MobilityCallOutput
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

    swagger_path '/researchers/{researcher_id}/mobility_calls' do
      operation :get do
        key :summary, 'Get all mobility calls by researcher'
        key :description, 'Returns all mobility calls by researcher'
        key :operationId, :get_mobility_calls_by_researcher
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls']

        parameter name: :researcher_id do
          key :in, :path
          key :description, 'ID of the researcher to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'mobility call response'
          schema do
            key :type, :array
            items do
              key :'$ref', :MobilityCallDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end

    swagger_path '/research_units/{research_group_id}/mobility_calls' do
      operation :get do
        key :summary, 'Get all mobility calls by research unit'
        key :description, 'Returns all mobility calls by research unit'
        key :operationId, :get_mobility_calls_by_research_group
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of the research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'mobility call response'
          schema do
            key :type, :array
            items do
              key :'$ref', :MobilityCallDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end

    swagger_path '/mobility_calls' do
      operation :get do
        key :summary, 'Get all mobility calls'
        key :description, 'Returns all mobility calls'
        key :operationId, :get_mobility_calls
        key :produces, ['application/json',]
        key :tags, ['Calls:: Mobility Calls']

        response 200 do
          key :description, 'mobility call response'
          schema do
            key :type, :array
            items do
              key :'$ref', :MobilityCallDxOutput
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