module Swagger::SeedbedMemberApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path "/api/v1/research_seedbed/{research_seedbed_id}/seedbed_member" do
      operation :get do
        key :description, "Traer todos los integrantes del semillero "
        key :operationId, :get_members
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Integrantes Semilleros de investigacion",
            #,
            ]
        parameter name: :research_seedbed_id do
          key :in, :path
          key :description, "Research Seedbed id"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Lista de integrantes del semillero de investigacion"

          schema do
            key :'$ref', :SeedbedMemberBase
          end
        end
      end
      operation :post do
        key :description, "Agregar un integrante aun grupo de investigacion o agregar un nuevo periodo en caso de que ya exista,
        la fecha de inicio es la del dia que se hace el registro"
        key :operationId, :create_agreement
        key :produces, ["application/json"]
        key :tags, [
              "Integrantes Semilleros de investigacion",
            #,
            ]
        parameter name: :research_seedbed_id do
          key :in, :path
          key :description, "Research Seedbed id"
          key :required, false
          key :type, :int64
        end
        parameter do
          key :name, :seedbed_member
          key :in, :body
          key :description, "Investigador y rol del investigador"
          key :required, true
          schema do
            property :seedbed_member do
              property :role_id do
                key :type, :integer
                #key :format, :date
              end
              property :researcher_id do
                key :type, :integer
              end
            end
          end
        end
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :SeedbedMemberComplete
          end
        end
        response :default do
          key :description, "unexpected error"
        end
      end
    end
    swagger_path "/api/v1/research_seedbed/{research_seedbed_id}/seedbed_member/{id}" do
      operation :get do
        key :description, "Traer el detalle de un integrante del grupo de investigacion "
        key :operationId, :get_members
        key :produces, [
          "application/json",
        ]
        key :tags, [
          "Integrantes Semilleros de investigacion",
        #,
        ]
        parameter name: :research_seedbed_id do
          key :in, :path
          key :description, "Research Seedbed id"
          key :required, false
          key :type, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, "Member id"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Informacion del integrante"

          schema do
            key :'$ref', :SeedbedMemberComplete
          end
        end
      end
    end
    swagger_path "/api/v1/research_seedbed/{research_seedbed_id}/seedbed_member/{id}/deactivate" do
      operation :put do
        key :description, "Desactivar un integrante"
        key :operationId, :deactivate_members
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Integrantes Semilleros de investigacion",
            #,
            ]
        parameter name: :research_seedbed_id do
          key :in, :path
          key :description, "Research Seedbed id"
          key :required, false
          key :type, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, "Member id"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Informacion del integrante"
  
          schema do
            key :'$ref', :SeedbedMemberComplete
          end
        end
      end
    end
  end
end
