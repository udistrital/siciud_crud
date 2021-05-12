module Swagger::IpLivestockBreedApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_group/{research_group_id}/ip_livestock_breeds/{id}' do
      operation :get do
        key :summary, 'Get a Improved Population of Livestock Breed of a Research Unit by ID'
        key :description, 'Returns a single improved population of livestock breed of a Research Unit by ID'
        key :operationId, :get_ip_livestock_breed_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Improved Population of Livestock Breeds']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of improved population of livestock breed of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'improved population of livestock breed response'
          schema do
            key :'$ref', :IpLivestockBreedOutput
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
        key :summary, 'Update Improved Population of Livestock Breed by ID'
        key :description, 'Returns the updated improved population of livestock breed of a Research Unit by ID'
        key :operationId, :update_ip_livestock_breed
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Improved Population of Livestock Breeds']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of improved population of livestock breed of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :ip_livestock_breed do
          key :in, :body
          key :description, 'Improved Population of Livestock Breed to update'
          key :required, true
          schema do
            key :'$ref', :IpLivestockBreedInput
          end
        end

        response 200 do
          key :description, 'improved population of livestock breed response'
          schema do
            key :'$ref', :IpLivestockBreedOutput
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

    swagger_path '/research_group/{research_group_id}/ip_livestock_breeds/' do
      operation :get do
        key :summary, 'Get all Improved Population of Livestock Breeds'
        key :description, 'Returns all improved population of livestock breeds of a Research Unit'
        key :operationId, :get_ip_livestock_breeds
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Improved Population of Livestock Breeds']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'improved population of livestock breed response'
          schema do
            key :type, :array
            items do
              key :'$ref', :IpLivestockBreedOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Improved Population of Livestock Breed'
        key :description, 'Returns the created improved population of livestock breed of a Research Unit'
        key :operationId, :create_ip_livestock_breed
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Improved Population of Livestock Breeds']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :ip_livestock_breed do
          key :in, :body
          key :description, 'Improved Population of Livestock Breed to register'
          key :required, true
          schema do
            key :'$ref', :IpLivestockBreedInput
          end
        end

        response 201 do
          key :description, 'improved population of livestock breed response'
          schema do
            key :'$ref', :IpLivestockBreedOutput
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

    swagger_path '/research_units/{research_group_id}/ip_livestock_breeds/{id}/active' do
      operation :put do
        key :summary, 'Activate or deactivate a Improved Population of Livestock Breed by ID'
        key :description, 'Returns the activated/deactivated improved population of livestock breed of a Research Unit by ID'
        key :operationId, :update_ip_livestock_breed
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Improved Population of Livestock Breeds']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of improved population of livestock breed of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :ip_livestock_breed do
          key :in, :body
          key :description, 'Improved Population of Livestock Breed to update'
          key :required, true
          schema do
            property :ip_livestock_breed do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'improved population of livestock breed response'
          schema do
            key :'$ref', :IpLivestockBreedOutput
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