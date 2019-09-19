module Swagger::ArpGeneralGoalApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path "/api/v1/agreement_research_project/{agreement_research_project_id}/arp_general_goal" do
      operation :get do
        key :description, "Traer el objetivo general de un proyecto de un convenio de investigacion"
        key :operationId, :get_arp_general_goal
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Objetivos de proyectos de investigacion",
            #,
            ]
        parameter name: :agreement_research_project_id do
          key :in, :path
          key :description, "Agreement Research Project ID"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Lista de contactos de la entidades financiadoras"
          schema do
            key :type, :array
            items do
              key :'$ref', :ArpGeneralGoal
            end
          end
        end
      end
      operation :post do
        key :description, "Crear el objetivo general de un proyecto de un convenio de investigacion"
        key :operationId, :create_fe_contact
        key :produces, ["application/json"]
        key :tags, [
              "Objetivos de proyectos de investigacion",
            #,
            ]
        parameter name: :agreement_research_project_id do
          key :in, :path
          key :description, "Agreement Research Project ID"
          key :required, false
          key :type, :int64
        end
        parameter do
          key :name, :arp_general_goal
          key :in, :body
          key :description, "Objetivo general"
          key :required, true
          schema do
            key :'$ref', :ArpGeneralGoalPost
          end
        end
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :ArpGeneralGoal
          end
        end
        response :default do
          key :description, "unexpected error"
        end
      end
    end
    swagger_path "/api/v1/agreement_research_project/{agreement_research_project_id}/arp_general_goal/{id}" do
      operation :get do
        key :description, "Ver un objetivo"
        key :operationId, :get_contact
        key :produces, [
          "application/json",
        ]
        key :tags, [
          "Objetivos de proyectos de investigacion",
        #,
        ]
        parameter name: :agreement_research_project_id do
          key :in, :path
          key :description, "agreement Research Project ID"
          key :required, false
          key :type, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, "Ap General Goal id"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :ArpGeneralGoal
          end
        end
      end
      operation :put do
        key :description, "Actualizar el objetivo general"
        key :operationId, :get_contact
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Objetivos de proyectos de investigacion",
            #,
            ]
        parameter name: :agreement_research_project_id do
          key :in, :path
          key :description, "agreement Research Project ID"
          key :required, false
          key :type, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, "Ap General Goal id"
          key :required, false
          key :type, :int64
        end
        parameter do
          key :name, :arp_general_goal
          key :in, :body
          key :description, "Objetivo general"
          key :required, true
          schema do
            key :'$ref', :ArpGeneralGoalPost
          end
        end
        # definición del success response
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :ArpGeneralGoal
          end
        end
      end
    end
  end
end
