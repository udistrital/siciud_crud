module Swagger::GroupMemberApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path "/api/v1/research_group/{research_group_id}/group_member" do
      operation :get do
        key :description, "Traer todos los convenios paginados "
        key :operationId, :get_members
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Miembros Grupos de investigacion",
            #,
            ]
        parameter name: :research_group_id do
          key :in, :path
          key :description, "Research group id"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Convenios"

          schema do
            #key :'$ref', :Agreement
          end
        end
      end
      operation :post do
        key :description, "Agregar un miembro"
        key :operationId, :create_agreement
        key :produces, ["application/json"]
        key :tags, [
              "Miembros Grupos de investigacion",
            #,
            ]
        parameter name: :research_group_id do
          key :in, :path
          key :description, "Research group id"
          key :required, false
          key :type, :int64
        end
        parameter do
          key :name, :agreement
          key :in, :body
          key :description, "Investigador y rol del investigador"
          key :required, true
          schema do
            property :group_member do
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
            key :'$ref', :Agreement
          end
        end
        response :default do
          key :description, "unexpected error"
        end
      end
    end
    swagger_path "/api/v1/research_group/{research_group_id}/group_member/{id}" do
      operation :get do
        key :description, "Traer todos los convenios paginados "
        key :operationId, :get_members
        key :produces, [
          "application/json",
        ]
        key :tags, [
          "Miembros Grupos de investigacion",
        #,
        ]
        parameter name: :research_group_id do
          key :in, :path
          key :description, "Research group id"
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
          key :description, "Miembro"

          schema do
            #key :'$ref', :Agreement
          end
        end
      end
    end
  end
end
