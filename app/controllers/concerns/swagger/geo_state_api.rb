module Swagger::GeoStateApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/geo_countries/{geo_country_id}/geo_states/{id}' do
      operation :get do
        key :summary, 'Get a State of a Country by ID'
        key :description, 'Returns a single state'
        key :operationId, :get_geo_state_by_id
        key :produces, ['application/json',]
        key :tags, ['Geo States']

        parameter name: :geo_country_id do
          key :in, :path
          key :description, 'Country ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, 'ID of geo state to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'geo state response'
          schema do
            key :'$ref', :GeoStateOutput
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

      # operation :put do
      #   key :summary, 'Update a State of a Country by ID'
      #   key :description, 'Returns the updated state'
      #   key :operationId, :update_geo_state
      #   key :produces, ['application/json',]
      #   key :tags, ['Geo States']
      #
      #   parameter name: :geo_country_id do
      #     key :in, :path
      #     key :description, 'Country ID to fetch'
      #     key :required, true
      #     key :type, :integer
      #     key :format, :int64
      #   end
      #   parameter name: :id do
      #     key :in, :path
      #     key :description, 'ID of geo state to fetch'
      #     key :required, true
      #     key :type, :integer
      #     key :format, :int64
      #   end
      #
      #   parameter name: :geo_state do
      #     key :in, :body
      #     key :description, 'State to update'
      #     key :required, true
      #     schema do
      #       key :'$ref', :GeoStateInput
      #     end
      #   end
      #
      #   response 200 do
      #     key :description, 'geo state response'
      #     schema do
      #       key :'$ref', :GeoStateOutput
      #     end
      #   end
      #   response 422 do
      #     key :description, 'Unprocessable Entity'
      #     schema do
      #       key :'$ref', :ErrorUnprocessableEntity
      #     end
      #   end
      #   response :default do
      #     key :description, 'Unexpected Error'
      #   end
      # end
    end

    swagger_path '/geo_countries/{geo_country_id}/geo_states/' do
      operation :get do
        key :summary, 'Get all States'
        key :description, 'Returns all states'
        key :operationId, :get_geo_states
        key :produces, ['application/json',]
        key :tags, ['Geo States']

        parameter name: :geo_country_id do
          key :in, :path
          key :description, 'Country ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'geo state response'
          schema do
            key :type, :array
            items do
              key :'$ref', :GeoStateOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      # operation :post do
      #   key :summary, 'Create a new State'
      #   key :description, 'Returns the created state'
      #   key :operationId, :create_geo_state
      #   key :produces, ['application/json',]
      #   key :tags, ['Geo States']
      #
      #   parameter name: :geo_state do
      #     key :in, :body
      #     key :description, 'State to register'
      #     key :required, true
      #     schema do
      #       key :'$ref', :GeoStateInput
      #     end
      #   end
      #
      #   response 201 do
      #     key :description, 'geo state response'
      #     schema do
      #       key :'$ref', :GeoStateOutput
      #     end
      #   end
      #   response 422 do
      #     key :description, 'Unprocessable Entity'
      #     schema do
      #       key :'$ref', :ErrorUnprocessableEntity
      #     end
      #   end
      #   response :default do
      #     key :description, 'Unexpected Error'
      #   end
      # end
    end
  end
end