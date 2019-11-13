class Api::V1::ArpAssignmentsController < ApplicationController
  before_action :set_agreement_research_project

  before_action :set_arp_assignment, only: [:show, :update]


  def index
    @arp_assignment = @agreement_research_project.arp_assignments
    render json: @arp_assignment
  end


  def show
    render json: @arp_assignment
  end


  def create
    @arp_assignment = @agreement_research_project.arp_assignments.new(arp_assignment_params)
    if @arp_assignment.save
      render json: @arp_assignment, status: :created
    else
      render json: @arp_assignment.errors, status: :unprocessable_entity
    end
  end


  def update
    if @arp_assignment.update(arp_assignment_params)
      render json: @arp_assignment
    else
      render json: @arp_assignment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_arp_assignment
    @arp_assignment = @agreement_research_project.arp_assignments.find_by(id: params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  # def set_arp_assignment
  #   @arp_assignment = ArpAssignment.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def arp_assignment_params
    params.require(:arp_assignment).permit(:name,:completedPercentage,:product_typology_id)
  end

  def set_agreement_research_project
    #@agreement_research_project = @agreement.agreement_research_projects.find_by(id: params[:id])
    @agreement_research_project = AgreementResearchProject.find(params[:agreement_research_project_id])
  end
end
