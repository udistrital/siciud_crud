module Swagger::IndicatorApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/indicators/{id}' do
      operation :get do
        key :summary, 'Get a indicator by ID'
        key :description, 'Returns a single indicator'
        key :operationId, :get_indicator_by_id
        key :produces, ['application/json',]
        key :tags, ['Call:: Indicators']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of indicator to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'indicator response'
          schema do
            key :'$ref', :IndicatorOutput
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
        key :summary, 'Update indicator by ID'
        key :description, 'Returns the updated indicator'
        key :operationId, :update_indicator
        key :produces, ['application/json',]
        key :tags, ['Call:: Indicators']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of indicator to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :indicator do
          key :in, :body
          key :description, 'indicator to update'
          key :required, true
          schema do
            key :'$ref', :IndicatorInputPut
          end
        end

        response 200 do
          key :description, 'indicator response'
          schema do
            key :'$ref', :IndicatorOutput
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
        key :summary, 'Activate or deactivate a indicator by ID'
        key :description, 'Returns the activated/deactivated indicator'
        key :operationId, :change_active_indicator
        key :produces, ['application/json',]
        key :tags, ['Call:: Indicators']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of indicator to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :indicator do
          key :in, :body
          key :description, 'indicator to activate or deactivate'
          key :required, true
          schema do
            property :indicator do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'indicator response'
          schema do
            key :'$ref', :IndicatorOutput
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

    swagger_path '/indicators' do
      operation :get do
        key :summary, 'Get all indicators'
        key :description, 'Returns all indicators'
        key :operationId, :get_indicators
        key :produces, ['application/json',]
        key :tags, ['Call:: Indicators']

        response 200 do
          key :description, 'indicator response'
          schema do
            key :type, :array
            items do
              key :'$ref', :IndicatorDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new indicators'
        key :description, 'Returns the created indicator'
        key :operationId, :create_indicator
        key :produces, ['application/json',]
        key :tags, ['Call:: Indicators']

        parameter name: :indicator do
          key :in, :body
          key :description, 'indicator to register'
          key :required, true
          schema do
            key :'$ref', :IndicatorInputPost
          end
        end

        response 201 do
          key :description, 'indicator response'
          schema do
            key :'$ref', :IndicatorOutput
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