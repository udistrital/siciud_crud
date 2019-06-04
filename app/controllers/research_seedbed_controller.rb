class ResearchSeedbedController < ApplicationController
  before_action :set_research_group, only: [:show, :update, :attach]

  #Manejo de excepciones de la database
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: e.message}, status: :not_found
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  def index
    @research_seedbeds = ResearchSeedbed.all
    #Director .members.where("role_id='1'")
    #if params[:search].present? && !params[:search].nil?
    @research_seedbeds = ResearchSeedbedsSearchService.search(@research_seedbeds,params[:name], params[:director],params[:facultyid])
    #end
    paginate json: @research_seedbeds.includes(:faculties, :curricular_projects, :research_focuses,
                                               :state_seedbed, :snies, :cidcActDocument_attachment, :facultyActDocument_attachment), per_page: 10
  end


  def show
    render json: @research_seedbed
  end

  def create
    @research_seedbed = ResearchSeedbed.new(research_seedbed_params)
    if (faculties = research_seedbed_params[:faculty_ids])
      faculties = faculties.split(',')
      @research_seedbed.faculty_ids = faculties
    end
     if(research_focus_ids = research_seedbed_params[:research_focus_ids])
    research_focus_ids = research_focus_ids.split(',')
    @research_group.research_focus_ids = research_focus_ids
    end

    if (curricular_project_ids = research_seedbed_params[:curricular_project_ids])
      curricular_project_ids = curricular_project_ids.split(',')
      @research_seedbed.curricular_project_ids = curricular_project_ids
    end
    if @research_seedbed.save
      render json: @research_seedbed, status: :created
    else
      render json: @research_seedbed.errors, status: :unprocessable_entity
    end
  end

  def update
    if @research_seedbed.update(research_seedbed_params)
      faculties = research_seedbed_params[:faculty_ids]
      faculties = faculties.split(',')
      @research_seedbed.faculty_ids = faculties
      research_focus_ids = research_seedbed_params[:research_focus_ids]
      research_focus_ids = research_focus_ids.split(',')
      @research_seedbed.research_focus_ids = research_focus_ids
      curricular_project_ids = research_seedbed_params[:curricular_project_ids]
      curricular_project_ids = curricular_project_ids.split(',')
      @research_seedbed.curricular_project_ids = curricular_project_ids
      if @research_seedbed.save
        render json: @research_seedbed
      else
        render json: @research_seedbed.errors, status: :unprocessable_entity
      end
    else
      render json: @research_seedbed.errors, status: :unprocessable_entity
    end
  end

  def attach
    params.permit(:facultyActDocument, :cidcActDocument)
    @research_seedbed.facultyActDocument.attach(params[:facultyActDocument])
    @researchresearch_seedbed_group.cidcActDocument.attach(params[:cidcActDocument])

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_research_seedbed
    @research_seedbed = ResearchSeedbed.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def research_seedbed_params
    params.require(:research_seed_bed).permit(:name, :acronym, :description, :cidcRegistrationDate,
                                              :cidcActNumber, :facultyActNumber, :facultyRegistrationDate, :state_seedbed_id,
                                              :snies_id, :mail, :webpage, :mission, :vision, :facultyActDocument, :cidcActDocument, :faculty_ids,
                                              :faculty_ids, :curricular_project_ids,:research_focus_ids)
  end


end
