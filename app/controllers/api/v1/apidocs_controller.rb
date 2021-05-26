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
        DocumentsController,
        GeoCitiesController,
        GeoCountriesController,
        GeoStatesController,
        CineBroadAreasController,
        CineSpecificAreasController,
        CineDetailedAreasController,
        OecdDisciplinesController,
        OecdKnowledgeAreasController,
        OecdKnowledgeSubareasController,
        ExtParticipantsController,
        DegreeWorksController,
        BookChaptersController,
        BooksController,
        IpLivestockBreedsController,
        NewAnimalBreedsController,
        PapersController,
        PatentsController,
        AwardsController,
        ResearchCreationWorksController,
        ScientificNotesController,
        VegetableVarietiesController,
        IntParticipantsController,
        AppropriationProcessesController,
        CreationWorkshopsController,
        EventsController,
        KnowledgeNetworksController,
        NewGeneticSequencesController,
        WorkingPapersController,
        BillsController,
        ClinicalPracticeGuidelinesController,
        DistinctiveSignsController,
        EnterpriseSecretsController,
        EnterprisesController,
        GuideManualsController,
        IndustrialDesignsController,
        InnovationsController,
        IntegratedCircuitDiagramsController,
        LicenseAgreementsController,
        NewScientificRecordsController,
        NutraceuticalProductsController,
        PlantIndPrototypesController,
        ProtocolActsController,
        RegulationsController,
        ScientificCollectionsController,
        SoftwareController,
        TechnicalConceptsController,
        ResearchersController,
        ResearchGroupController,
        GroupMemberController,
        GmStatesController,
        RoleController,
        SubtypesController,
        TypesController,
        UserRolesController,
        UsersController,

        ColcienciasCall,
        ColcienciasCategory,
        HistoricalColcienciasRank,
        Document,
        GeoCity,
        GeoCountry,
        GeoState,
        CineBroadArea,
        CineSpecificArea,
        CineDetailedArea,
        OecdDiscipline,
        OecdKnowledgeArea,
        OecdKnowledgeSubarea,
        ExtParticipant,
        BookChapter,
        Book,
        IpLivestockBreed,
        NewAnimalBreed,
        Researcher,
        ResearchGroup,
        Paper,
        Patent,
        Award,
        ResearchCreationWork,
        ScientificNote,
        VegetableVariety,
        IntParticipant,
        AppropriationProcess,
        CreationWorkshop,
        Event,
        KnowledgeNetwork,
        NewGeneticSequence,
        WorkingPaper,
        GroupMember,
        GmState,
        Role,
        Subtype,
        Type,
        UserRole,
        User,
        PlantIndPrototype,
        ProtocolAct,
        Regulation,
        ScientificCollection,
        Software,
        TechnicalConcept,
        LicenseAgreement,
        NewScientificRecord,
        NutraceuticalProduct,
        DegreeWork,
        Bill,
        ClinicalPracticeGuideline,
        DistinctiveSign,
        EnterpriseSecret,
        Enterprise,
        GuideManual,
        IndustrialDesign,
        Innovation,
        IntegratedCircuitDiagram,

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
