module Swagger::Integrated
  Circuit DiagramApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_units/{research_group_id}/integrated_circuit_diagrams/{id}' do
      operation :get do
        key :summary, 'Get a new Integrated Circuit Diagram of a Research Unit by ID'
        key :description, 'Returns a single Integrated Circuit Diagram'
        key :operationId, :get_integrated_circuit_diagram_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Integrated Circuit Diagram']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of new Integrated Circuit Diagram of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'new Integrated Circuit Diagram response'
          schema do
            key :'$ref', :IntegratedCircuitDiagram
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
        key :summary, 'Update Integrated Circuit Diagram by ID'
        key :description, 'Returns the updated Integrated Circuit Diagram'
        key :operationId, :update_integrated_circuit_diagram_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Integrated Circuit Diagram']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Integrated Circuit Diagram of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :integrated_circuit_diagram do
          key :in, :body
          key :description, 'new Integrated Circuit Diagram to update'
          key :required, true
          schema do
            key :'$ref', :IntegratedCircuitDiagramInputPut
          end
        end

        response 200 do
          key :description, 'Integrated Circuit Diagram response'
          schema do
            key :'$ref', :IntegratedCircuitDiagramOutput
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

    swagger_path '/research_units/{research_group_id}/integrated_circuit_diagrams/' do
      operation :get do
        key :summary, 'Get all Integrated Circuit Diagram'
        key :description, 'Returns all Integrated Circuit Diagram'
        key :operationId, :get_integrated_circuit_diagram
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Integrated Circuit Diagram']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Integrated Circuit Diagram response'
          schema do
            key :type, :array
            items do
              key :'$ref', :IntegratedCircuitDiagramDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a Integrated Circuit Diagram'
        key :description, 'Returns the created Integrated Circuit Diagram'
        key :operationId, :create_integrated_circuit_diagram
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Integrated Circuit Diagram']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :new_integrated_circuit_diagram do
          key :in, :body
          key :description, 'Industrial Design to register'
          key :required, true
          schema do
            key :'$ref', :IntegratedCircuitDiagramInputPost
          end
        end

        response 201 do
          key :description, 'Integrated Circuit Diagram response'
          schema do
            key :'$ref', :IntegratedCircuitDiagramOutput
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

    swagger_path '/research_units/{research_group_id}/integrated_circuit_diagrams/{id}/active' do
      operation :put do
        key :summary, 'Activate or deactivate a Integrated Circuit Diagram by ID'
        key :description, 'Returns the activated/deactivated Integrated Circuit Diagram'
        key :operationId, :change_active_integrated_circuit_diagram_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Integrated Circuit Diagram']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Integrated Circuit Diagram of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :integrated_circuit_diagram do
          key :in, :body
          key :description, 'Integrated Circuit Diagram to activate/deactivate'
          key :required, true
          schema do
            property :integrated_circuit_diagram do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'Integrated Circuit Diagram response'
          schema do
            key :'$ref', :IntegratedCircuitDiagramOutput
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