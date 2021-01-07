module Api
  module V1
    class ApidocsController < ApplicationController
      include Swagger::Blocks

      swagger_root do
        key :swagger, "2.0"
        info do
          key :version, "1.0.0"
          key :title, "API Sistema de informacion de investigadores 2.0"
          key :description, "A sample users CRUD API"
          contact do
            key :name, "https://github.com/siciud-cidc"
          end
        end
        key :host, ENV["HOST"]
        key :basePath, "/"
        key :consumes, ["application/json"]
        key :produces, ["application/json"]
      end

      # A list of all classes that have swagger_* declarations.
      SWAGGERED_CLASSES = [
          CategoriesController,
          CineBroadAreasController,
          CineSpecificAreasController,
          CineDetailedAreasController,
          Category,
          CineBroadArea,
          CineSpecificArea,
          CineDetailedArea,
          ApplicationRecord,
          self,
      ].freeze

      # SWAGGERED_CLASSES = [
      #   Agreement,
      #   GroupMember,
      #   SeedbedMember,
      #   FeContact,
      #   ArpGeneralGoal,
      #   ArpSpecificGoal,
      #   ArpActivity,
      #   AgreementController,
      #   CountryController,
      #   GroupMemberController,
      #   SeedbedMemberController,
      #   FeContactController,
      #   ArpGeneralGoalController,
      #   ArpSpecificGoalController,
      #   ArpActivityController,
      #   self,
      # ].freeze

      def index
        render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      end
    end
  end
end
