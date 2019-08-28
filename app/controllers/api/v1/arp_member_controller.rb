class Api::V1::ArpMemberController < ApplicationController
  before_action :set_agreement_research_project
  before_action :set_arp_member, only: [:show, :update]

  def index
    @arp_members = @agreement_research_project.arp_members
    #@arp_members = ArpMember.all
    render json: @arp_members
  end

  def show
    render json: @arp_member
  end

  def create
    @arp_member = arp_members.new(arp_member_params)
    if @arp_member.save
      render json: @arp_member, status: :created
    else
      render json: @arp_member.errors, status: :unprocessable_entity
    end
  end

  def update
    if @arp_member.update(arp_member_params)
      render json: @arp_member
    else
      render json: @arp_member.errors, status: :unprocessable_entity
    end
  end

  private

  def set_agreement_research_project
    #@agreement_research_project = @agreement.agreement_research_projects.find_by(id: params[:id])
    @agreement_research_project = AgreementResearchProject.find(params[:agreement_research_project_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_arp_member
    @arp_member = @agreement_research_project.arp_members.find_by(id: params[:id])
    #@arp_member = ArpMember.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def arp_member_params
    params.require(:arp_member).permit(:arp_role_id, :agreement_id, :group_member_id)
  end
end
