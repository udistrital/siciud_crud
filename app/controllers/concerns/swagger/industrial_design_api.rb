module Swagger::IndustrialDesignApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_units/{research_group_id}/industrial_designs/{id}' do
      operation :get do
        key :summary, 'Get a new Industrial Design of a Research Unit by ID'
        key :description, 'Returns a single Industrial Design'
        key :operationId, :get_industrial_design_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::IndustrialDesign']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of new Industrial Design of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'new Industrial Design response'
          schema do
            key :'$ref', :IndustrialDesignOutput
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
        key :summary, 'Update Industrial Design by ID'
        key :description, 'Returns the updated Industrial Design'
        key :operationId, :update_industrial_design_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::IndustrialDesign']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Industrial Design of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :industrial_design do
          key :in, :body
          key :description, 'new Industrial Design to update'
          key :required, true
          schema do
            key :'$ref', :IndustrialDesignInputPut
          end
        end

        response 200 do
          key :description, 'Industrial Design response'
          schema do
            key :'$ref', :IndustrialDesignOutput
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

    swagger_path '/research_units/{research_group_id}/industrial_designs/' do
      operation :get do
        key :summary, 'Get all Industrial Design'
        key :description, 'Returns all Industrial Design'
        key :operationId, :get_industrial_design
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::IndustrialDesign']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Industrial Design response'
          schema do
            key :type, :array
            items do
              key :'$ref', :IndustrialDesignDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a Industrial Design'
        key :description, 'Returns the created Industrial Design'
        key :operationId, :create_industrial_design
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::IndustrialDesign']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :new_industrial_design do
          key :in, :body
          key :description, 'Industrial Design to register'
          key :required, true
          schema do
            key :'$ref', :IndustrialDesignInputPost
          end
        end

        response 201 do
          key :description, 'Industrial Design response'
          schema do
            key :'$ref', :IndustrialDesignOutput
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

    swagger_path '/research_units/{research_group_id}/industrial_designs/{id}/active' do
      operation :put do
        key :summary, 'Activate or deactivate a Industrial Design by ID'
        key :description, 'Returns the activated/deactivated Industrial Design'
        key :operationId, :change_active_industrial_design_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::IndustrialDesign']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Industrial Design of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :industrial_design do
          key :in, :body
          key :description, 'Industrial Design to activate/deactivate'
          key :required, true
          schema do
            property :industrial_design do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'Industrial Design response'
          schema do
            key :'$ref', :IndustrialDesignOutput
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