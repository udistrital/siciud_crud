module Swagger::NonSpecializedPublicationApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/non_specialized_publications/{id}' do
      operation :get do
        key :summary, 'Get a Non Specialized Publication by ID'
        key :description, 'Returns a single Non Specialized Publication'
        key :operationId, :get_non_specialized_publication_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Non Specialized Publications']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Non Specialized Publication to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'non specialized publication response'
          schema do
            key :'$ref', :NonSpecializedPublicationOutput
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
        key :summary, 'Update Non Specialized Publication by ID'
        key :description, 'Returns the updated Non Specialized Publication'
        key :operationId, :update_non_specialized_publication
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Non Specialized Publications']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Non Specialized Publication to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :non_specialized_publication do
          key :in, :body
          key :description, 'Non Specialized Publication to update'
          key :required, true
          schema do
            key :'$ref', :NonSpecializedPublicationInputPut
          end
        end

        response 200 do
          key :description, 'non specialized publication response'
          schema do
            key :'$ref', :NonSpecializedPublicationOutput
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
        key :summary, 'Activate or deactivate a Non Specialized Publication by ID'
        key :description, 'Returns the activated/deactivated Non Specialized Publication'
        key :operationId, :change_active_non_specialized_publication
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Non Specialized Publications']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Non Specialized Publication to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :non_specialized_publication do
          key :in, :body
          key :description, 'Non Specialized Publication to activate or deactivate'
          key :required, true
          schema do
            property :non_specialized_publication do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'non specialized publication response'
          schema do
            key :'$ref', :NonSpecializedPublicationOutput
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

    swagger_path '/research_units/{research_group_id}/non_specialized_publications' do
      operation :get do
        key :summary, 'Get all Non Specialized Publications'
        key :description, 'Returns all Non Specialized Publications'
        key :operationId, :get_non_specialized_publications
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Non Specialized Publications']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'non specialized publication response'
          schema do
            key :type, :array
            items do
              key :'$ref', :NonSpecializedPublicationDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Non Specialized Publications'
        key :description, 'Returns the created Non Specialized Publication'
        key :operationId, :create_non_specialized_publication
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Non Specialized Publications']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :non_specialized_publication do
          key :in, :body
          key :description, 'Non Specialized Publication to register'
          key :required, true
          schema do
            key :'$ref', :NonSpecializedPublicationInputPost
          end
        end

        response 201 do
          key :description, 'non specialized publication response'
          schema do
            key :'$ref', :NonSpecializedPublicationOutput
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