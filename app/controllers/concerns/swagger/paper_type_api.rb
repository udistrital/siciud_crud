module Swagger::PaperTypeApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/paper_types/{id}' do
      operation :get do
        key :summary, 'Get Paper Type by ID'
        key :description, 'Returns a single paper type'
        key :operationId, :get_paper_type_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Paper Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of paper type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'paper type response'
          schema do
            key :'$ref', :PaperTypeOutput
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
        key :summary, 'Update Paper Type by ID'
        key :description, 'Returns the updated paper type'
        key :operationId, :update_paper_type
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Paper Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of peper type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :paper_type do
          key :in, :body
          key :description, 'Paper Type to update'
          key :required, true
          schema do
            key :'$ref', :PaperTypeInput
          end
        end

        response 200 do
          key :description, 'paper type response'
          schema do
            key :'$ref', :PaperTypeOutput
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

    swagger_path '/paper_types/' do
      operation :get do
        key :summary, 'Get all Paper Types'
        key :description, 'Returns all paper types'
        key :operationId, :get_paper_types
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Paper Types']

        response 200 do
          key :description, 'paper type response'
          schema do
            key :type, :array
            items do
              key :'$ref', :PaperTypeOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Paper Type'
        key :description, 'Returns the created paper type'
        key :operationId, :create_paper_type
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Paper Types']

        parameter name: :paper_type do
          key :in, :body
          key :description, 'Paper Type to register'
          key :required, true
          schema do
            key :'$ref', :PaperTypeInput
          end
        end

        response 201 do
          key :description, 'paper type response'
          schema do
            key :'$ref', :PaperTypeOutput
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