module Api
  module V1
    class GroupMemberController < ApplicationController
      include Swagger::GroupMemberApi

      before_action :set_research_group
      before_action :set_group_member, only: [:show, :update]

      def index
        @group_members = @research_group.group_members.order(:created_at)
        render json: @group_members.includes(:researcher, :role),
               each_serializer: GroupMemberBaseSerializer
      end

      def show
        render json: @group_member
      end

      def create
        params[:group_member][:gm_state_id] = 1
        researcher_id = params[:group_member][:researcher_id]
        @group_member = @research_group.group_members.find_by(researcher_id: researcher_id)
        if @group_member
          if @group_member.gm_periods.last.final_date
            @group_member.role_id = params[:group_member][:role_id]
            @group_member.updated_by = params[:group_member][:created_by]
            if @group_member.save
              render json: @group_member, status: :ok
            else
              render json: @group_member.errors, status: :unprocessable_entity
            end
          else
            msg = "A new period cannot be assigned if the member is still active"
            return render json: { "error": msg }, status: :unprocessable_entity
          end
        else
          @group_member = @research_group.group_members.new(
            group_member_params_to_create)
          if @group_member.save
            render json: @group_member, status: :created
          else
            render json: @group_member.errors, status: :unprocessable_entity
          end
        end
      end

      def update
        if @group_member.update(group_member_params_to_update)
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
        @research_group = ResearchGroup.find(params[:research_group_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def group_member_params_to_create
        params.require(:group_member).permit(:role_id, :researcher_id,
                                             :gm_state_id, :active,
                                             :created_by)
      end

      def group_member_params_to_update
        params.require(:group_member).permit(:role_id, :researcher_id,
                                             :gm_state_id, :active,
                                             :updated_by)
      end
    end
  end
end
