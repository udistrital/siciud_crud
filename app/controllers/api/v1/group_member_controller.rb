module Api
  module V1
    class GroupMemberController < ApplicationController
      before_action :set_research_group
      before_action :set_group_member, only: [:show, :update, :destroy]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def index
        @group_members = @research_group.group_members

        render json: @group_members
      end

      def show
        render json: @group_member
      end

      def create
        if (@research_group.group_members.find_by(researcher_id: params[:group_member][:researcher_id]))
          @group_member = @research_group.group_members.find_by(researcher_id: params[:group_member][:researcher_id])
          if (@group_member.gm_periods.last.finalDate)
            @gm_periods = @group_member.gm_periods.new(initialDate: DateTime.now.in_time_zone(-5).to_date,
                                                       role_id: params[:group_member][:role_id])
            if @gm_periods.save
              render json: @group_member, status: :created
              #, location: research_project_plan_path(@research_project_plan)
            else
              render json: @gm_periods.errors, status: :unprocessable_entity
            end
            render json: @group_member, status: :created
          else
            return render json: { "error": "No se puede asignar un nuevo periodo si el integrante aun se encuentra activo" }, status: :not_acceptable
          end
        else
          @group_member = @research_group.group_members.new(group_member_params)
          @group_member.state_researcher_id = 1
          if @group_member.save
            @gm_periods = @group_member.gm_periods.new(initialDate: DateTime.now.in_time_zone(-5).to_date,
                                                       role_id: params[:group_member][:role_id])
            @gm_periods.save
            render json: @group_member, status: :created
            #, location: research_project_plan_path(@research_project_plan)
          else
            render json: @group_member.errors, status: :unprocessable_entity
          end
        end
      end

      def update
        if @group_member.update(group_member_params)
          render json: @group_member
        else
          render json: @group_member.errors, status: :unprocessable_entity
        end
      end

      private

      def set_group_member
        @group_member = @research_group.group_members.find_by(id: params[:id])
      end

      def set_research_group
        #@contribution = @agreement.contributions.find_by(id: params[:contribution_id])
        #byebug
        @research_group = ResearchGroup.find(params[:research_group_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def group_member_params
        params.require(:group_member).permit(:role_id, :researcher_id)
      end
    end
  end
end
