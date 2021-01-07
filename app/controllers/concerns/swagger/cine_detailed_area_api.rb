module Swagger::CineDetailedAreaApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/api/v1/cine_detailed_areas/{id}' do
      operation :put do
        key :summary, 'Update Detailed Area of ISCED by ID'
        key :description, 'Returns the updated Detailed Area of ISCED'
        key :operationId, :update_cine_detailed_area
        key :produces, ['application/json',]
        key :tags, ['Detailed Areas of International Standard Classification of Education - ISCED']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of detailed area of ISCED to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :cine_detailed_area do
          key :in, :body
          key :description, 'Detailed area of ISCED to update'
          key :required, true
          schema do
            key :'$ref', :CineDetailedAreaInput
          end
        end

        response 200 do
          key :description, 'Detailed Area of  ISCED response'
          schema do
            key :'$ref', :CineDetailedAreaOutput
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

    swagger_path '/api/v1/cine_detailed_areas/' do
      operation :get do
        key :summary, 'Get all Detailed Areas of ISCED'
        key :description, 'Returns all detailed areas of ISCED'
        key :operationId, :get_cine_detailed_areas
        key :produces, ['application/json',]
        key :tags, ['Detailed Areas of International Standard Classification of Education - ISCED']

        response 200 do
          key :description, 'Detailed Area of ISCED response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CineDetailedAreaOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Detailed Area of ISCED by ID'
        key :description, 'Returns the created detailed area'
        key :operationId, :create_cine_detailed_area
        key :produces, ['application/json',]
        key :tags, ['Detailed Areas of International Standard Classification of Education - ISCED']

        parameter name: :cine_detailed_area do
          key :in, :body
          key :description, 'Detailed Area to register'
          key :required, true
          schema do
            key :'$ref', :CineDetailedAreaInput
          end
        end

        response 201 do
          key :description, 'Detailed Area of ISCED response'
          schema do
            key :'$ref', :CineDetailedAreaOutput
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