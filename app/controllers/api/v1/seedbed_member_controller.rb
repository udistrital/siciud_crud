module Api
  module V1
    class SeedbedMemberController < ApplicationController
      before_action :set_research_seedbed
      before_action :set_seedbed_member, only: [:show, :update, :destroy, :deactivate]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def index
        @seedbed_members = @research_seedbed.seedbed_members
        render json: @seedbed_members
      end

      def show
        render json: @seedbed_member
      end

      def create
        if (@research_seedbed.seedbed_members.find_by(researcher_id: params[:seedbed_member][:researcher_id]))
          @seedbed_member = @research_seedbed.seedbed_members.find_by(researcher_id: params[:seedbed_member][:researcher_id])
          if (@seedbed_member.sm_periods.last.finalDate)
            @sm_period = @seedbed_member.sm_periods.new(initialDate: DateTime.now.in_time_zone(-5).to_date,
                                                        role_id: params[:seedbed_member][:role_id])

            @seedbed_member.role_id = params[:seedbed_member][:role_id]
            @seedbed_member.state_researcher_id = 1
            @seedbed_member.save
            if (@sm_period.save)
              render json: @seedbed_member, status: :created
            else
              render json: @sm_period.errors, status: :unprocessable_entity
            end
          else
            return render json: { "error": "No se puede asignar un nuevo periodo si el integrante aun se encuentra activo" }, status: :not_acceptable
          end
        else
          @seedbed_member = @research_seedbed.seedbed_members.new(seedbed_member_params)
          @seedbed_member.state_researcher_id = 1
          if @seedbed_member.save
            @sm_periods = @seedbed_member.sm_periods.new(initialDate: DateTime.now.in_time_zone(-5).to_date,
                                                         role_id: params[:seedbed_member][:role_id])
            @sm_periods.save
            render json: @seedbed_member, status: :created
            #, location: research_project_plan_path(@research_project_plan)
          else
            render json: @seedbed_member.errors, status: :unprocessable_entity
          end
        end
      end

      def update
        if @seedbed_member.update(seedbed_member_params)
          render json: @seedbed_member
        else
          render json: @seedbed_member.errors, status: :unprocessable_entity
        end
      end

      def deactivate
        @sm_period = @seedbed_member.sm_periods.last
        @sm_period.finalDate = DateTime.now.in_time_zone(-5).to_date
        @seedbed_member.state_researcher_id = 2
        if @seedbed_member.save && @sm_period.save
          render json: @seedbed_member
        else
          render json: @seedbed_member.errors, status: :unprocessable_entity
        end
      end

      private

      def set_seedbed_member
        @seedbed_member = @research_seedbed.seedbed_members.find_by(id: params[:id])
      end

      def set_research_seedbed
        #@contribution = @agreement.contributions.find_by(id: params[:contribution_id])
        #byebug
        @research_seedbed = ResearchSeedbed.find(params[:research_seedbed_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def seedbed_member_params
        params.require(:seedbed_member).permit(:role_id, :researcher_id)
      end
    end
  end
end
