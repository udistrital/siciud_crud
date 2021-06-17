module Swagger::GroupMemberApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_units/{research_group_id}/group_member/{id}' do
      operation :get do
        key :summary, 'Get a Group Member of a Research Unit by ID'
        key :description, 'Returns a single group member'
        key :operationId, :get_group_member_by_id
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Members']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of group member of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'group member response'
          schema do
            key :'$ref', :GroupMemberOutput
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
        key :summary, 'Update Group Member by ID'
        key :description, 'Returns the updated group member'
        key :operationId, :update_group_member
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Members']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of group member of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :group_member do
          key :in, :body
          key :description, 'Group Member to update'
          key :required, true
          schema do
            key :'$ref', :GroupMemberInput
          end
        end

        response 200 do
          key :description, 'group member response'
          schema do
            key :'$ref', :GroupMemberOutput
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

    swagger_path '/research_units/{research_group_id}/group_member' do
      operation :get do
        key :summary, 'Get all Group Members'
        key :description, 'Returns all group members'
        key :operationId, :get_group_members
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Members']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'group member response'
          schema do
            key :type, :array
            items do
              key :'$ref', :GroupMemberOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Group Member'
        key :description, 'Returns the created group member'
        key :operationId, :create_group_member
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Members']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :group_member do
          key :in, :body
          key :description, 'Group Member to register'
          key :required, true
          schema do
            key :'$ref', :GroupMemberInput
          end
        end

        response 201 do
          key :description, 'group member response'
          schema do
            key :'$ref', :GroupMemberOutput
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

    swagger_path '/research_units/{research_group_id}/group_member/{id}/deactivate' do
      operation :put do
        key :summary, 'Deactivate a member of an research unit by ID'
        key :description, 'Returns the deactivated member by id of a research unit by research_group_id'
        key :operationId, :deactivate_group_member
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Members']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of group member of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :group_member do
          key :in, :body
          key :description, 'Group Member to deactivate'
          key :required, true
          schema do
            key :'$ref', :GroupMemberDeactivate
          end
        end

        response 200 do
          key :description, 'book response'
          schema do
            key :'$ref', :BookOutput
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
