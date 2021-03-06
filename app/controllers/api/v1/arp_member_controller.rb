
class Api::V1::ArpMemberController < ApplicationController
  before_action :set_agreement_research_project
  before_action :set_arp_member, only: [:show, :update]

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: e.message}, status: :not_found
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  def index
    @arp_members = @agreement_research_project.arp_members
    #byebug
    if (@agreement_research_project.agreement.arp_members.find_by(arp_role_id: 1) && !@arp_members.find_by(id: @agreement_research_project.agreement.arp_members.find_by(arp_role_id: 1).id ))
      @arp_members = @arp_members.to_a
      @arp_members.push(@agreement_research_project.agreement.arp_members.find_by(arp_role_id: 1))
    end
    @arp_members =  @arp_members.sort_by {|member| member.arp_role_id}

    #byebug
    #@arp_members = ArpMember.all
    render json: @arp_members
  end

  def show
    render json: @arp_member
  end

  def create
    if ArpMember.find_by(agreement_id: @agreement_research_project.agreement.id,
                         group_member_id: params[:arp_member][:group_member_id],
                         agreement_research_project_id: params[:agreement_research_project_id])
      return render json: {"error": "El investigador Ya  se encuentra registrado en el proyecto"}
    else
      if (@agreement_research_project.agreement.arp_members.find_by(arp_role_id: 1) && params[:arp_member][:arp_role_id] == 1)
        return render json: {"error": "El Convenio Ya Cuenta con un investigador principal"}
      else
        @arp_member = @agreement_research_project.arp_members.new(arp_member_params)
        @arp_member.agreement_id = @agreement_research_project.agreement.id
        if @arp_member.save
          render json: @arp_member, status: :created
        else
          render json: @arp_member.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    #if (@agreement_research_project.agreement.arp_members.find_by(arp_role_id: 1) && params[:arp_member][:arp_role_id] == 1)
    # render json: { "error": "El Convenio Ya Cuenta con un investigador principal" }
    #else
    if @arp_member.update(arp_member_params)
      render json: @arp_member
    else
      render json: @arp_member.errors, status: :unprocessable_entity
    end
    #end
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
    params.require(:arp_member).permit(:arp_role_id, :group_member_id)
  end
end
