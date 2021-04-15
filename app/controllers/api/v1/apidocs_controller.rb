module Api
  module V1
    class ApidocsController < ApplicationController
      include Swagger::Blocks

      swagger_root do
        key :swagger, "2.0"
        info do
          key :version, "1.0.0"
          key :title, "API SICIUD 2.0"
          key :description, "A sample users CRUD API"
          contact do
            key :name, "https://github.com/udistrital/siciud_crud.git"
          end
        end
        key :host, ENV["HOST"]
        key :basePath, "/api/v1"
        key :consumes, ["application/json"]
        key :produces, ["application/json"]
      end

      # A list of all classes that have swagger_* declarations.
      # This list is ordered by the areas and groups that make up.
      # For example, areas of knowledge or type of production.
      SWAGGERED_CLASSES = [
        ColcienciasCallsController,
        ColcienciasCategoriesController,
        HistoricalColcienciasRanksController,
        GeoCitiesController,
        GeoCountriesController,
        GeoStatesController,
        CineBroadAreasController,
        CineSpecificAreasController,
        CineDetailedAreasController,
        OecdDisciplinesController,
        OecdKnowledgeAreasController,
        OecdKnowledgeSubareasController,
        ProductTypesController,
        ProductTypologiesController,
        KnwlSpecAreasController,
        CategoriesController,
        CycleTypesController,
        EditorialsController,
        ExtParticipantsController,
        BookChaptersController,
        BooksController,
        IpLivestockBreedsController,
        NewAnimalBreedsController,
        PaperTypesController,
        PapersController,
        PatentStatesController,
        PatentsController,
        AwardsController,
        ResearchCreationWorksController,
        ScientificNotesController,
        VegetableVarietiesController,
        WorkTypesController,
        IntParticipantsController,
        JournalsController,
        ParticipantTypesController,
        PetitionStatusesController,
        ResearchFocusController,
        ResearchersController,
        ResearchGroupController,
        GroupMemberController,
        GroupStatesController,
        GroupTypesController,
        GmStatesController,
        RoleController,
        SubtypesController,
        TypesController,
        UserRolesController,
        UsersController,

        ColcienciasCall,
        ColcienciasCategory,
        HistoricalColcienciasRank,
        GeoCity,
        GeoCountry,
        GeoState,
        CineBroadArea,
        CineSpecificArea,
        CineDetailedArea,
        OecdDiscipline,
        OecdKnowledgeArea,
        OecdKnowledgeSubarea,
        ProductType,
        ProductTypology,
        KnwlSpecArea,
        Category,
        CycleType,
        Editorial,
        ExtParticipant,
        BookChapter,
        Book,
        IpLivestockBreed,
        NewAnimalBreed,
        ResearchFocus,
        Researcher,
        ResearchGroup,
        PaperType,
        Paper,
        PatentState,
        Patent,
        Award,
        ResearchCreationWork,
        ScientificNote,
        VegetableVariety,
        WorkType,
        IntParticipant,
        Journal,
        ParticipantType,
        PetitionStatus,
        GroupMember,
        GroupState,
        GroupType,
        GmState,
        Role,
        Subtype,
        Type,
        UserRole,
        User,

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
