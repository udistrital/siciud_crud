module Swagger::GroupTypeApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/api/v1/group_types/{id}' do
      # operation :get do
      #   key :summary, 'Get a Group Type by ID'
      #   key :description, 'Returns a single group type'
      #   key :operationId, :get_group_type_by_id
      #   key :produces, ['application/json',]
      #   key :tags, ['Research Units::Group Types']
      #
      #   parameter name: :id do
      #     key :in, :path
      #     key :description, 'ID of group type to fetch'
      #     key :required, true
      #     key :type, :integer
      #     key :format, :int64
      #   end
      #
      #   response 200 do
      #     key :description, 'group type response'
      #     schema do
      #       key :'$ref', :GroupTypeOutput
      #     end
      #   end
      #   response 404 do
      #     key :description, 'Not Found'
      #     schema do
      #       key :'$ref', :ErrorNotFound
      #     end
      #   end
      #   response :default do
      #     key :description, 'Unexpected Error'
      #   end
      # end

      operation :put do
        key :summary, 'Update Group Type by ID'
        key :description, 'Returns the updated group type'
        key :operationId, :update_group_type
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of group type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :group_type do
          key :in, :body
          key :description, 'Group Type to update'
          key :required, true
          schema do
            key :'$ref', :GroupTypeInput
          end
        end

        response 200 do
          key :description, 'group type response'
          schema do
            key :'$ref', :GroupTypeOutput
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

    swagger_path '/api/v1/group_types/' do
      operation :get do
        key :summary, 'Get all Group Types'
        key :description, 'Returns all Group Types'
        key :operationId, :get_group_types
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Types']

        response 200 do
          key :description, 'group type response'
          schema do
            key :type, :array
            items do
              key :'$ref', :GroupTypeOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new group type'
        key :description, 'Returns the created group type'
        key :operationId, :create_group_type
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Types']

        parameter name: :group_type do
          key :in, :body
          key :description, 'Group Type to register'
          key :required, true
          schema do
            key :'$ref', :GroupTypeInput
          end
        end

        response 201 do
          key :description, 'group type response'
          schema do
            key :'$ref', :GroupTypeOutput
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