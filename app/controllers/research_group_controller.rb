class ResearchGroupController < ApplicationController
  before_action :set_research_group, only: [:show, :update, :attach]


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
    #if params[:search].present? && !params[:search].nil?
    @research_groups = ResearchGroupsSearchService.search(@research_groups, params[:name], params[:director],params[:facultyid],params[:category])
    #end
    paginate json: @research_groups.includes(:faculties, :curricular_projects, :research_focuses,
                                             :state_group, :snies, :cidcActDocument_attachment, :facultyActDocument_attachment), per_page: 10
  end

  #Mostrar detalle de un grupo

  def show
    render json: @research_group
  end

  #Crear un grupo
  def create
    @research_group = ResearchGroup.new(research_group_params)
    if (faculties = research_group_params[:faculty_ids])
      faculties = faculties.split(',')
      @research_group.faculty_ids = faculties
    end
    if (research_focus_ids = research_group_params[:research_focus_ids])
      research_focus_ids = research_focus_ids.split(',')
      @research_group.research_focus_ids = research_focus_ids
    end
    if (curricular_project_ids = research_group_params[:curricular_project_ids])
      curricular_project_ids = curricular_project_ids.split(',')
      @research_group.curricular_project_ids = curricular_project_ids
    end
    if @research_group.save
      render json: @research_group, status: :created
    else
      render json: @research_group.errors, status: :unprocessable_entity
    end
  end

  #Actualizar un grupo

  def update
    if @research_group.update(research_group_params)
      faculties = research_group_params[:faculty_ids]
      faculties = faculties.split(',')
      @research_group.faculty_ids = faculties
      research_focus_ids = research_group_params[:research_focus_ids]
      research_focus_ids = research_focus_ids.split(',')
      @research_group.research_focus_ids = research_focus_ids
      curricular_project_ids = research_group_params[:curricular_project_ids]
      curricular_project_ids = curricular_project_ids.split(',')
      @research_group.curricular_project_ids = curricular_project_ids
      if @research_group.save
        render json: @research_group
      else
        render json: @research_group.errors, status: :unprocessable_entity
      end
    else
      render json: @research_group.errors, status: :unprocessable_entity
    end
  end

  #Actualizar  documentos de un grupo

  def attach
    params.permit(:facultyActDocument, :cidcActDocument)
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
    params.require(:research_group).permit(:name, :acronym, :description, :cidcRegistrationDate,
                                           :cidcActNumber, :facultyActNumber, :facultyRegistrationDate, :state_group_id,
                                           :snies_id, :email, :colcienciasCode, :gruplac, :webpage, :mission, :vision, :facultyActDocument, :cidcActDocument, :faculty_ids,
                                           :research_focus_ids, :curricular_project_ids)
  end
end
