module Swagger::NewAnimalBreedApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_units/{research_group_id}/new_animal_breeds/{id}' do
      operation :get do
        key :summary, 'Get a New Animal Breed of a Research Unit by ID'
        key :description, 'Returns a single new animal breed of a research unit by ID'
        key :operationId, :get_new_animal_breed_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::New Animal Breeds']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of new animal breed of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'new animal breed response'
          schema do
            key :'$ref', :NewAnimalBreedOutput
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
        key :summary, 'Update new animal breed by ID'
        key :description, 'Returns the updated new animal breed'
        key :operationId, :update_new_animal_breed
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::New Animal Breeds']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of new animal breed of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :new_animal_breed do
          key :in, :body
          key :description, 'New animal breed to update'
          key :required, true
          schema do
            key :'$ref', :NewAnimalBreedInputPut
          end
        end

        response 200 do
          key :description, 'new animal breed response'
          schema do
            key :'$ref', :NewAnimalBreedOutput
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

    swagger_path '/research_units/{research_group_id}/new_animal_breeds/' do
      operation :get do
        key :summary, 'Get all New Animal Breeds'
        key :description, 'Returns all new animal breeds'
        key :operationId, :get_new_animal_breeds
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::New Animal Breeds']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'new animal breed response'
          schema do
            key :type, :array
            items do
              key :'$ref', :NewAnimalBreedDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a New New Animal Breed'
        key :description, 'Returns the created new animal breed'
        key :operationId, :create_new_animal_breed
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::New Animal Breeds']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :new_animal_breed do
          key :in, :body
          key :description, 'New Animal Breed to register'
          key :required, true
          schema do
            key :'$ref', :NewAnimalBreedInputPost
          end
        end

        response 201 do
          key :description, 'new animal breed response'
          schema do
            key :'$ref', :NewAnimalBreedOutput
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

    swagger_path '/research_units/{research_group_id}/new_animal_breeds/{id}/active' do
      operation :put do
        key :summary, 'Activate or deactivate a new animal breed by ID'
        key :description, 'Returns the activated/deactivated new animal breed by id of a research unit by research_group_id'
        key :operationId, :change_active_new_animal_breed
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::New Animal Breeds']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of new animal breed of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :new_animal_breed do
          key :in, :body
          key :description, 'New animal breed to update'
          key :required, true
          schema do
            property :new_animal_breed do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'new animal breed response'
          schema do
            key :'$ref', :NewAnimalBreedOutput
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