module Swagger::InformativeBulletinApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/informative_bulletins/{id}' do
      operation :get do
        key :summary, 'Get a Informative Bulletin by ID'
        key :description, 'Returns a single informative bulletins'
        key :operationId, :get_informative_bulletin_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Informative Bulletins']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of informative bulletins to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'informative bulletins response'
          schema do
            key :'$ref', :InformativeBulletinOutput
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
        key :summary, 'Update Informative Bulletin by ID'
        key :description, 'Returns the updated informative bulletins'
        key :operationId, :update_informative_bulletin
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Informative Bulletins']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of informative bulletins to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :informative_bulletin do
          key :in, :body
          key :description, 'Informative Bulletin to update'
          key :required, true
          schema do
            key :'$ref', :InformativeBulletinInputPut
          end
        end

        response 200 do
          key :description, 'informative bulletins response'
          schema do
            key :'$ref', :InformativeBulletinOutput
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
        key :summary, 'Activate or deactivate a Informative Bulletin by ID'
        key :description, 'Returns the activated/deactivated informative bulletins'
        key :operationId, :change_active_informative_bulletin
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Informative Bulletins']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of informative bulletins to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :informative_bulletin do
          key :in, :body
          key :description, 'Informative Bulletin to activate or deactivate'
          key :required, true
          schema do
            property :informative_bulletin do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'informative bulletins response'
          schema do
            key :'$ref', :InformativeBulletinOutput
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

    swagger_path '/research_units/{research_group_id}/informative_bulletins' do
      operation :get do
        key :summary, 'Get all Informative Bulletins'
        key :description, 'Returns all informative bulletins'
        key :operationId, :get_informative_bulletins
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Informative Bulletins']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'informative bulletins response'
          schema do
            key :type, :array
            items do
              key :'$ref', :InformativeBulletinDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Informative Bulletins'
        key :description, 'Returns the created informative bulletins'
        key :operationId, :create_informative_bulletin
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Informative Bulletins']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :informative_bulletin do
          key :in, :body
          key :description, 'Informative Bulletin to register'
          key :required, true
          schema do
            key :'$ref', :InformativeBulletinInputPost
          end
        end

        response 201 do
          key :description, 'informative bulletins response'
          schema do
            key :'$ref', :InformativeBulletinOutput
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