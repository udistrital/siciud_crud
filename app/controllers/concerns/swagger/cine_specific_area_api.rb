module Swagger::CineSpecificAreaApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/api/v1/cine_specific_areas/{id}' do
      operation :put do
        key :summary, 'Update Specific Area of ISCED by ID'
        key :description, 'Returns the updated Specific Area of ISCED'
        key :operationId, :update_cine_specific_area
        key :produces, ['application/json',]
        key :tags, ['Specific Areas of International Standard Classification of Education - ISCED']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of specific area of ISCED to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :cine_specific_area do
          key :in, :body
          key :description, 'Specific area of ISCED to update'
          key :required, true
          schema do
            key :'$ref', :CineSpecificAreaInput
          end
        end

        response 200 do
          key :description, 'Specific Area of  ISCED response'
          schema do
            key :'$ref', :CineSpecificAreaOutput
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

    swagger_path '/api/v1/cine_specific_areas/' do
      operation :get do
        key :summary, 'Get all Specific Areas of ISCED'
        key :description, 'Returns all specific areas of ISCED'
        key :operationId, :get_cine_specific_areas
        key :produces, ['application/json',]
        key :tags, ['Specific Areas of International Standard Classification of Education - ISCED']

        response 200 do
          key :description, 'Specific Area of ISCED response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CineSpecificAreaOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Specific Area of ISCED by ID'
        key :description, 'Returns the created specific area'
        key :operationId, :create_cine_specific_area
        key :produces, ['application/json',]
        key :tags, ['Specific Areas of International Standard Classification of Education - ISCED']

        parameter name: :cine_specific_area do
          key :in, :body
          key :description, 'Specific Area to register'
          key :required, true
          schema do
            key :'$ref', :CineSpecificAreaInput
          end
        end

        response 201 do
          key :description, 'Specific Area of ISCED response'
          schema do
            key :'$ref', :CineSpecificAreaOutput
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