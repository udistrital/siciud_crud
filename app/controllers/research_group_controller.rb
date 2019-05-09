class ResearchGroupController < ApplicationController
    before_action :set_research_group, only: [:show, :update,:attach]


  #Manejo de excepciones de la database
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: e.message}, status: :not_found
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
end
    #Listar todos los grupos

  def index
    @research_groups = ResearchGroup.all
    #Director .members.where("role_id='1'")
    if params[:search].present? && !params[:search].nil?  
      @research_groups = ResearchGroupsSearchService.search(@research_groups,params[:search])
    end
    paginate json: @research_groups.includes(:faculties,:curricular_projects,:research_focuses,
      :state_group,:snies,:cidcActDocument_attachment,:facultyActDocument_attachment), per_page: 10
  end
  
    #Mostrar detalle de un grupo

  def show
    render json: @research_group
  end
   
  #Crear un grupo
  def create
    @research_group = ResearchGroup.new(research_group_params)

    if @research_group.save
      render json: @research_group, status: :created
    else
      render json: @research_group.errors, status: :unprocessable_entity
    end
  end
  
  #Actualizar un grupo

  def update
    if @research_group.update(research_group_params)
      render json: @research_group
    else
      render json: @research_group.errors, status: :unprocessable_entity
    end
  end

  #Actualizar  documentos de un grupo

  def attach
    
    @research_group.facultyActDocument.attach(params[:facultyActDocument])
    @research_group.cidcActDocument.attach(params[:cidcActDocument])

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_group
      @research_group = ResearchGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def research_group_params
      params.require(:research_group).permit(:name,:acronym,:description,:cidcRegistrationDate,
        :cidcActNumber,:facultyActNumber,:facultyRegistrationDate,:state_group_id,
        :snies_id,:email,:colcienciasCode,:gruplac,:webpage,:mission,:vision,:facultyActDocument,:cidcActDocument,
        research_focus_ids: [],faculty_ids: [],curricular_project_ids: [])

    end
end
