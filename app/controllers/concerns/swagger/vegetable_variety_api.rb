module Swagger::VegetableVarietyApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_group/{research_group_id}/vegetable_varieties/{id}' do
      operation :get do
        key :summary, 'Get a vegetable variety of a Research Unit by ID'
        key :description, 'Returns a single vegetable variety of a Research Unit'
        key :operationId, :get_vegetable_variety_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Vegetable Varieties']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of vegetable variety of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'vegetable variety response'
          schema do
            key :'$ref', :VegetableVarietyOutput
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
        key :summary, 'Update Vegetable Variety by ID'
        key :description, 'Returns the updated vegetable variety of a Research Unit'
        key :operationId, :update_vegetable_variety
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Vegetable Varieties']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of vegetable variety of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :vegetable_variety do
          key :in, :body
          key :description, 'Vegetable Variety to update'
          key :required, true
          schema do
            key :'$ref', :VegetableVarietyInput
          end
        end

        response 200 do
          key :description, 'vegetable variety response'
          schema do
            key :'$ref', :VegetableVarietyOutput
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

    swagger_path '/research_group/{research_group_id}/vegetable_varieties/' do
      operation :get do
        key :summary, 'Get all Vegetable Varieties'
        key :description, 'Returns all Vegetable Varieties of a Research Unit'
        key :operationId, :get_vegetable_varieties
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Vegetable Varieties']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'vegetable variety response'
          schema do
            key :type, :array
            items do
              key :'$ref', :VegetableVarietyDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Vegetable Variety'
        key :description, 'Returns the created Vegetable Variety of a Research Unit'
        key :operationId, :create_vegetable_variety
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Vegetable Varieties']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :vegetable_variety do
          key :in, :body
          key :description, 'Vegetable variety to register'
          key :required, true
          schema do
            key :'$ref', :VegetableVarietyInput
          end
        end

        response 201 do
          key :description, 'vegetable variety response'
          schema do
            key :'$ref', :VegetableVarietyOutput
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