module Api
  module V1
    class GroupMemberController < ApplicationController
      include Swagger::GroupMemberApi

      before_action :set_research_group
      before_action :set_group_member, only: [:show, :update, :deactivate]

      def index
        @group_members = @research_group.group_members.order(:created_at)
        render json: @group_members.includes(:researcher, :role),
               each_serializer: GroupMemberBaseSerializer
      end

      def show
        render json: @group_member
      end

      def create
        researcher_id = params[:group_member][:researcher_id]
        @group_member = @research_group.group_members.find_by(researcher_id: researcher_id)
        if @group_member
          if @group_member.gm_periods.last.final_date
            @group_member.role_id = params[:group_member][:role_id]
            save_member(@group_member)
          else
            msg = "A new period cannot be assigned if the member is still active"
            return render json: { "error": msg }, status: :unprocessable_entity
          end
        else
          @group_member = @research_group.group_members.new(group_member_params_to_create)
          save_member(@group_member)
        end
      end

      def update
        if @group_member.update(group_member_params_to_update)
          if @group_member.gm_periods.last.final_date
            create_new_period(@group_member, params[:group_member][:updated_by])
          else
            @gm_period = @group_member.gm_periods.last
            @gm_period.final_date = DateTime.now.in_time_zone(-5).to_date
            @gm_period.updated_by = params[:group_member][:updated_by]
            if @gm_period.save
              create_new_period(@group_member, params[:group_member][:updated_by])
            else
              render json: @gm_period.errors, status: :unprocessable_entity
            end
          end
        else
          render json: @group_member.errors, status: :unprocessable_entity
        end
      end

      def deactivate
        @gm_period = @group_member.gm_periods.last
        @gm_period.final_date = DateTime.now.in_time_zone(-5).to_date
        @group_member.gm_state_id = 2
        if @group_member.save && @gm_period.save
          render json: @group_member
        else
          render json: @group_member.errors, status: :unprocessable_entity
        end
      end

      private

      def save_member(group_member)
        group_member.gm_state_id = params[:group_member][:gm_state_id]
        if group_member.save
          @gm_periods = group_member.gm_periods.new(initial_date: DateTime.now.in_time_zone(-5).to_date,
                                                    role_id: params[:group_member][:role_id])
          if @gm_periods.save
            render json: group_member, status: :created
          else
            render json: @gm_periods.errors, status: :unprocessable_entity
          end
        else
          render json: group_member.errors, status: :unprocessable_entity
        end
      end

      def create_new_period(group_member, user_id)
        @gm_periods = group_member.gm_periods.new(initial_date: DateTime.now.in_time_zone(-5).to_date,
                                                  role_id: params[:group_member][:role_id],
                                                  created_by: user_id)
        if @gm_periods.save
          render json: group_member, status: :created
        else
          render json: @gm_periods.errors, status: :unprocessable_entity
        end
      end

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
