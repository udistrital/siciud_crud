module Swagger::CineBroadAreaApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/api/v1/cine_broad_areas/{id}' do
      operation :put do
        key :summary, 'Update Broad Area of ISCED by ID'
        key :description, 'Returns the updated Broad Area of ISCED'
        key :operationId, :update_cine_broad_area
        key :produces, ['application/json',]
        key :tags, ['ISCED - Broad Areas of International Standard Classification of Education']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of broad area of ISCED to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :cine_broad_area do
          key :in, :body
          key :description, 'Broad area of ISCED to update'
          key :required, true
          schema do
            key :'$ref', :CineBroadAreaInput
          end
        end

        response 200 do
          key :description, 'Broad Area of  ISCED response'
          schema do
            key :'$ref', :CineBroadAreaOutput
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

    swagger_path '/api/v1/cine_broad_areas/' do
      operation :get do
        key :summary, 'Get all Broad Areas of ISCED'
        key :description, 'Returns all broad areas of ISCED'
        key :operationId, :get_cine_broad_areas
        key :produces, ['application/json',]
        key :tags, ['ISCED - Broad Areas of International Standard Classification of Education']

        response 200 do
          key :description, 'Broad Area of ISCED response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CineBroadAreaOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Broad Area of ISCED'
        key :description, 'Returns the created broad area'
        key :operationId, :create_cine_broad_area
        key :produces, ['application/json',]
        key :tags, ['ISCED - Broad Areas of International Standard Classification of Education']

        parameter name: :cine_broad_area do
          key :in, :body
          key :description, 'Broad Area to register'
          key :required, true
          schema do
            key :'$ref', :CineBroadAreaInput
          end
        end

        response 201 do
          key :description, 'Broad Area of ISCED response'
          schema do
            key :'$ref', :CineBroadAreaOutput
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
