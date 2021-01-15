module Swagger::GeoCountryApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/api/v1/geo_countries/{id}' do
      operation :get do
        key :summary, 'Get a Country by ID'
        key :description, 'Returns a single country'
        key :operationId, :get_geo_country_by_id
        key :produces, ['application/json',]
        key :tags, ['Geo Countries']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of geo country to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'geo country response'
          schema do
            key :'$ref', :GeoCountryOutput
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
      #   key :summary, 'Update a Country by ID'
      #   key :description, 'Returns the updated country'
      #   key :operationId, :update_geo_country
      #   key :produces, ['application/json',]
      #   key :tags, ['Geo Countries']
      #
      #   parameter name: :id do
      #     key :in, :path
      #     key :description, 'ID of geo country to fetch'
      #     key :required, true
      #     key :type, :integer
      #     key :format, :int64
      #   end
      #
      #   parameter name: :geo_country do
      #     key :in, :body
      #     key :description, 'Country to update'
      #     key :required, true
      #     schema do
      #       key :'$ref', :GeoCountryInput
      #     end
      #   end
      #
      #   response 200 do
      #     key :description, 'geo country response'
      #     schema do
      #       key :'$ref', :GeoCountryOutput
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

    swagger_path '/api/v1/geo_countries/' do
      operation :get do
        key :summary, 'Get all Countries'
        key :description, 'Returns all countries'
        key :operationId, :get_geo_countries
        key :produces, ['application/json',]
        key :tags, ['Geo Countries']

        response 200 do
          key :description, 'geo country response'
          schema do
            key :type, :array
            items do
              key :'$ref', :GeoCountryOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      # operation :post do
      #   key :summary, 'Create a new Country'
      #   key :description, 'Returns the created country'
      #   key :operationId, :create_geo_country
      #   key :produces, ['application/json',]
      #   key :tags, ['Geo Countries']
      #
      #   parameter name: :geo_country do
      #     key :in, :body
      #     key :description, 'Country to register'
      #     key :required, true
      #     schema do
      #       key :'$ref', :GeoCountryInput
      #     end
      #   end
      #
      #   response 201 do
      #     key :description, 'geo country response'
      #     schema do
      #       key :'$ref', :GeoCountryOutput
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