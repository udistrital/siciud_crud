module Swagger::PlantIndPrototypeApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_units/{research_group_id}/plant_ind_prototypes/{id}' do
      operation :get do
        key :summary, 'Get a Pilot Plant and Industrial Prototypes of a Research Unit by ID'
        key :description, 'Returns a single Pilot Plant and Industrial Prototypes'
        key :operationId, :get_plant_ind_prototype_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::PlantIndPrototypes']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Pilot Plant and Industrial Prototypes of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Pilot Plant and Industrial Prototypes response'
          schema do
            key :'$ref', :PlantIndPrototypeOutput
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
        key :summary, 'Update Pilot Plant or Industrial Prototype by ID'
        key :description, 'Returns the updated Pilot Plant or Industrial Prototype'
        key :operationId, :update_plant_ind_prototype_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::PlantIndPrototypes']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Plant or Industrial Prototype of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :plant_ind_prototypes do
          key :in, :body
          key :description, 'Pilot Plant or Industrial Prototype to update'
          key :required, true
          schema do
            key :'$ref', :PlantIndPrototypeInputPut
          end
        end

        response 200 do
          key :description, 'Pilot Plant or Industrial Prototype response'
          schema do
            key :'$ref', :PlantIndPrototypeOutput
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

    swagger_path '/research_units/{research_group_id}/plant_ind_prototypes/' do
      operation :get do
        key :summary, 'Get all Plant or Industrial Prototype'
        key :description, 'Returns all Plant or Industrial Prototype'
        key :operationId, :get_plant_ind_prototypes
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::PlantIndPrototypes']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :plt_type_id do
          key :in, :query
          key :description, 'ID of type to fetch'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Plant or Industrial Prototype response'
          schema do
            key :type, :array
            items do
              key :'$ref', :PlantIndPrototypeDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Plant or Industrial Prototype'
        key :description, 'Returns the created Plant or Industrial Prototype'
        key :operationId, :create_plant_ind_prototypes
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::PlantIndPrototypes']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :plant_ind_prototypes do
          key :in, :body
          key :description, 'Plant or Industrial Prototype to register'
          key :required, true
          schema do
            key :'$ref', :PlantIndPrototypeInputPost
          end
        end

        response 201 do
          key :description, 'Plant or Industrial Prototype response'
          schema do
            key :'$ref', :PlantIndPrototypeOutput
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