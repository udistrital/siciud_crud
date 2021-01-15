module Swagger::GeoCityApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/geo_states/{geo_state_id}/geo_cities/{id}' do
      operation :get do
        key :summary, 'Get a City of a State by ID'
        key :description, 'Returns a single geo city'
        key :operationId, :get_geo_city_by_id
        key :produces, ['application/json',]
        key :tags, ['Geo Cities']

        parameter name: :geo_state_id do
          key :in, :path
          key :description, 'State ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, 'ID of geo city to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'geo city response'
          schema do
            key :'$ref', :GeoCityOutput
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
      #   key :summary, 'Update a City of a State by ID'
      #   key :description, 'Returns the updated city'
      #   key :operationId, :update_geo_city
      #   key :produces, ['application/json',]
      #   key :tags, ['Geo Cities']
      #
      #   parameter name: :geo_state_id do
      #     key :in, :path
      #     key :description, 'State ID to fetch'
      #     key :required, true
      #     key :type, :integer
      #     key :format, :int64
      #   end
      #   parameter name: :id do
      #     key :in, :path
      #     key :description, 'ID of geo city to fetch'
      #     key :required, true
      #     key :type, :integer
      #     key :format, :int64
      #   end
      #
      #   parameter name: :geo_city do
      #     key :in, :body
      #     key :description, 'City to update'
      #     key :required, true
      #     schema do
      #       key :'$ref', :GeoCityInput
      #     end
      #   end
      #
      #   response 200 do
      #     key :description, 'geo city response'
      #     schema do
      #       key :'$ref', :GeoCityOutput
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

    swagger_path '/geo_states/{geo_state_id}/geo_cities/' do
      operation :get do
        key :summary, 'Get all Cities'
        key :description, 'Returns all cities'
        key :operationId, :get_geo_cities
        key :produces, ['application/json',]
        key :tags, ['Geo Cities']

        response 200 do
          key :description, 'geo city response'
          schema do
            key :type, :array
            items do
              key :'$ref', :GeoCityOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      # operation :post do
      #   key :summary, 'Create a new City'
      #   key :description, 'Returns the created city'
      #   key :operationId, :create_geo_city
      #   key :produces, ['application/json',]
      #   key :tags, ['Geo Cities']
      #
      #   parameter name: :geo_city do
      #     key :in, :body
      #     key :description, 'City to register'
      #     key :required, true
      #     schema do
      #       key :'$ref', :GeoCityInput
      #     end
      #   end
      #
      #   response 201 do
      #     key :description, 'geo city response'
      #     schema do
      #       key :'$ref', :GeoCityOutput
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