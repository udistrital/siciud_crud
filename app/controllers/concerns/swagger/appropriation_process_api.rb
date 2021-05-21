module Swagger::AppropriationProcessApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/appropriation_processes/{id}' do
      operation :get do
        key :summary, 'Get a Appropriation Process by ID'
        key :description, 'Returns a single Appropriation Process'
        key :operationId, :get_appropriation_process_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Appropriation Processes']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Appropriation Process to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'appropriation process response'
          schema do
            key :'$ref', :AppropriationProcessOutput
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
        key :summary, 'Update Appropriation Process by ID'
        key :description, 'Returns the updated Appropriation Process'
        key :operationId, :update_appropriation_process
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Appropriation Processes']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Appropriation Process to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :appropriation_process do
          key :in, :body
          key :description, 'Appropriation Process to update'
          key :required, true
          schema do
            key :'$ref', :AppropriationProcessInputPut
          end
        end

        response 200 do
          key :description, 'appropriation process response'
          schema do
            key :'$ref', :AppropriationProcessOutput
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

      operation :patch do
        key :summary, 'Activate or deactivate a Appropriation Process by ID'
        key :description, 'Returns the activated/deactivated Appropriation Process'
        key :operationId, :change_active_appropriation_process
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Appropriation Processes']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Appropriation Process to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :appropriation_process do
          key :in, :body
          key :description, 'Appropriation Process to activate or deactivate'
          key :required, true
          schema do
            property :appropriation_process do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'appropriation process response'
          schema do
            key :'$ref', :AppropriationProcessOutput
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

    swagger_path '/research_units/{research_group_id}/appropriation_processes' do
      operation :get do
        key :summary, 'Get all Appropriation Processes'
        key :description, 'Returns all Appropriation Processes'
        key :operationId, :get_appropriation_processes
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Appropriation Processes']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :product_type_id do
          key :in, :query
          key :description, 'ID of type to fetch'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'appropriation process response'
          schema do
            key :type, :array
            items do
              key :'$ref', :AppropriationProcessDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Appropriation Processes'
        key :description, 'Returns the created Appropriation Process'
        key :operationId, :create_appropriation_process
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Appropriation Processes']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :appropriation_process do
          key :in, :body
          key :description, 'Appropriation Process to register'
          key :required, true
          schema do
            key :'$ref', :AppropriationProcessInputPost
          end
        end

        response 201 do
          key :description, 'appropriation process response'
          schema do
            key :'$ref', :AppropriationProcessOutput
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