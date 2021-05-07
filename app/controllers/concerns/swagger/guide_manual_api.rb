  module Swagger::GuideManualApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/guide_manuals/{id}' do
      operation :get do
        key :summary, 'Get a Guide Manual by ID'
        key :description, 'Returns a single Guide Manual'
        key :operationId, :get_guide_manual_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Guide Manuals']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Guide Manual to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'guide manual response'
          schema do
            key :'$ref', :GuideManualOutput
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
        key :summary, 'Update Guide Manual by ID'
        key :description, 'Returns the updated Guide Manual'
        key :operationId, :update_guide_manual
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Guide Manuals']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Guide Manual to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :guide_manual do
          key :in, :body
          key :description, 'Guide Manual to update'
          key :required, true
          schema do
            key :'$ref', :GuideManualInputPut
          end
        end

        response 200 do
          key :description, 'guide manual response'
          schema do
            key :'$ref', :GuideManualOutput
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
        key :summary, 'Activate or deactivate a Guide Manual by ID'
        key :description, 'Returns the activated/deactivated Guide Manual'
        key :operationId, :change_active_guide_manual
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Guide Manuals']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Guide Manual to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :guide_manual do
          key :in, :body
          key :description, 'Guide Manual to activate or deactivate'
          key :required, true
          schema do
            property :guide_manual do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'guide manual response'
          schema do
            key :'$ref', :GuideManualOutput
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

    swagger_path '/research_units/{research_group_id}/guide_manuals/' do
      operation :get do
        key :summary, 'Get all Guide Manuals'
        key :description, 'Returns all Guide Manuals'
        key :operationId, :get_guide_manuals
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Guide Manuals']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'guide manual response'
          schema do
            key :type, :array
            items do
              key :'$ref', :GuideManualDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Guide Manuals'
        key :description, 'Returns the created Guide Manual'
        key :operationId, :create_guide_manual
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Guide Manuals']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :guide_manual do
          key :in, :body
          key :description, 'Guide Manual to register'
          key :required, true
          schema do
            key :'$ref', :GuideManualInputPost
          end
        end

        response 201 do
          key :description, 'guide manual response'
          schema do
            key :'$ref', :GuideManualOutput
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