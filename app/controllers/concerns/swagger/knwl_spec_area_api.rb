module Swagger::KnwlSpecAreaApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/knwl_spec_areas/{id}' do
      operation :get do
        key :summary, 'Get a Area of Knowledge and Specialization by ID'
        key :description, 'Returns a single area of knowledge and specialization'
        key :operationId, :get_knwl_spec_area_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Areas of Knowledge and Specialization']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of area of knowledge and specialization to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'area of knowledge and specialization response'
          schema do
            key :'$ref', :KnwlSpecAreaOutput
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
        key :summary, 'Update Area of Knowledge and Specialization by ID'
        key :description, 'Returns the updated area of knowledge and specialization'
        key :operationId, :update_knwl_spec_area
        key :produces, ['application/json',]
        key :tags, ['Products::Areas of Knowledge and Specialization']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of area of knowledge and specialization to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :knwl_spec_area do
          key :in, :body
          key :description, 'area of knowledge and specialization to update'
          key :required, true
          schema do
            key :'$ref', :KnwlSpecAreaInput
          end
        end

        response 200 do
          key :description, 'area of knowledge and specialization response'
          schema do
            key :'$ref', :KnwlSpecAreaOutput
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

    swagger_path '/knwl_spec_areas/' do
      operation :get do
        key :summary, 'Get all Areas of Knowledge and Specialization'
        key :description, 'Returns all areas of knowledge and specialization'
        key :operationId, :get_knwl_spec_areas
        key :produces, ['application/json',]
        key :tags, ['Products::Areas of Knowledge and Specialization']

        response 200 do
          key :description, 'area of knowledge and specialization response'
          schema do
            key :type, :array
            items do
              key :'$ref', :KnwlSpecAreaOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Area of Knowledge and Specialization'
        key :description, 'Returns the created area of knowledge and specialization'
        key :operationId, :create_knwl_spec_area
        key :produces, ['application/json',]
        key :tags, ['Products::Areas of Knowledge and Specialization']

        parameter name: :knwl_spec_area do
          key :in, :body
          key :description, 'Area of Knowledge and Specialization to register'
          key :required, true
          schema do
            key :'$ref', :KnwlSpecAreaInput
          end
        end

        response 201 do
          key :description, 'area of knowledge and specialization response'
          schema do
            key :'$ref', :KnwlSpecAreaOutput
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