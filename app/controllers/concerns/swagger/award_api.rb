module Swagger::AwardApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/api/v1/research_creation_works/{research_creation_work_id}/awards/{id}' do
      operation :get do
        key :summary, 'Get an Award from a Research Creation Work by ID'
        key :description, 'Returns a single category'
        key :operationId, :get_award_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::RCW::Awards']

        parameter name: :research_creation_work_id do
          key :in, :path
          key :description, 'ID of research creation work to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of award from a research creation work to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'award response'
          schema do
            key :'$ref', :AwardOutput
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
        key :summary, 'Update Award from a Research Creation Work by ID'
        key :description, 'Returns the updated award'
        key :operationId, :update_award
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::RCW::Awards']

        parameter name: :research_creation_work_id do
          key :in, :path
          key :description, 'ID of research creation work to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of award from a research creation work to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :award do
          key :in, :body
          key :description, 'Award to update'
          key :required, true
          schema do
            key :'$ref', :AwardInput
          end
        end

        response 200 do
          key :description, 'award response'
          schema do
            key :'$ref', :AwardOutput
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

    swagger_path '/api/v1/research_creation_works/{research_creation_work_id}/awards/' do
      operation :get do
        key :summary, 'Get all Awards from a Research Creation Work'
        key :description, 'Returns all awards from a Research Creation Work'
        key :operationId, :get_awards
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::RCW::Awards']

        parameter name: :research_creation_work_id do
          key :in, :path
          key :description, 'ID of research creation work to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'award response'
          schema do
            key :type, :array
            items do
              key :'$ref', :AwardOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Award for a Research Creation Work'
        key :description, 'Returns the created award'
        key :operationId, :create_award
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::RCW::Awards']

        parameter name: :award do
          key :in, :body
          key :description, 'Award to register'
          key :required, true
          schema do
            key :'$ref', :AwardInput
          end
        end

        response 201 do
          key :description, 'award response'
          schema do
            key :'$ref', :AwardOutput
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