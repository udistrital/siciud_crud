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
        CallsController,
        CallDocumentsController,
        CallEvalCriteriaController,
        IndicatorsController,
        CallsIndicatorsController,
        CallItemsController,
        ScheduleActivitiesController,
        ChaptersController,
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
        AccompanimentConsultanciesController,
        DegreeWorksController,
        ExtensionProjectsController,
        IdiInvestigationProjectsController,
        InvestigationProjectsController,
        TrainingCoursesController,
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
        ConsultanciesController,
        CreationWorkshopsController,
        ContentGenerationsController,
        EventsController,
        KnowledgeNetworksController,
        InformativeBulletinsController,
        MagazineEditionsController,
        NewGeneticSequencesController,
        ReportsController,
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
        PublicationsController,
        RegulationsController,
        ScientificCollectionsController,
        SoftwareController,
        SimpleBooksController,
        TechnicalConceptsController,
        ResearchersController,
        ResearchGroupController,
        ActionPlansController,
        FormAActPlansController,
        FormBActPlansController,
        FormCActPlansController,
        FormDActPlansController,
        FormEActPlansController,
        GroupMemberController,
        GmPeriodsController,
        GmStatesController,
        RoleController,
        SniesController,
        SubtypesController,
        TypesController,
        UserRolesController,
        UsersController,
        ProceduresController,
        ProfessionalRolesController,
        TaskModelsController,
        NextTasksController,
        TaskAttributesController,
        ReadAttributesController,
        OtriProfessionalsController,
        ProcedureRequestsController,
        RequestHasProceduresController,
        TechnologyDescriptionsController,
        RequestHasApplicationAreasController,
        PotentialMarketsController,
        TechnologicalSituationsController,
        FunctionalApplicationsController,
        TasksController,
        BudgetsController,
        TaskHasStatesController,

        Call,
        CallDocument,
        CallEvalCriterion,
        Indicator,
        CallsIndicator,
        CallItem,
        ScheduleActivity,
        Chapter,
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
        ActionPlan,
        FormAActPlan,
        FormBActPlan,
        FormCActPlan,
        FormDActPlan,
        FormEActPlan,
        Paper,
        Patent,
        Award,
        ResearchCreationWork,
        ScientificNote,
        VegetableVariety,
        IntParticipant,
        AppropriationProcess,
        Consultancy,
        CreationWorkshop,
        ContentGeneration,
        Event,
        KnowledgeNetwork,
        InformativeBulletin,
        MagazineEdition,
        NewGeneticSequence,
        Report,
        WorkingPaper,
        GroupMember,
        GmPeriod,
        GmState,
        Role,
        Snies,
        Subtype,
        Type,
        UserRole,
        User,
        PlantIndPrototype,
        ProtocolAct,
        Publication,
        Regulation,
        ScientificCollection,
        Software,
        SimpleBook,
        TechnicalConcept,
        LicenseAgreement,
        NewScientificRecord,
        NutraceuticalProduct,
        AccompanimentConsultancy,
        DegreeWork,
        ExtensionProject,
        IdiInvestigationProject,
        InvestigationProject,
        TrainingCourse,
        Bill,
        ClinicalPracticeGuideline,
        DistinctiveSign,
        EnterpriseSecret,
        Enterprise,
        GuideManual,
        IndustrialDesign,
        Innovation,
        IntegratedCircuitDiagram,
        Procedure,
        ProfessionalRole,
        TaskModel,
        NextTask,
        TaskAttribute,
        ReadAttribute,
        OtriProfessional,
        ProcedureRequest,
        RequestHasProcedure,
        TechnologyDescription,
        RequestHasApplicationArea,
        PotentialMarket,
        TechnologicalSituation,
        FunctionalApplication,
        Task,
        Budget,
        TaskHasState,

        ApplicationRecord,
        self,
      ].freeze

      def index
        render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      end
    end
  end
end
