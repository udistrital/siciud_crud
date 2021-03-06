module Api
  module V1
    class GmPeriodsController < ApplicationController
      include Swagger::GmPeriodApi

      before_action :validate_initial_date, only: [:create, :update]
      before_action :validate_final_date, only: [:create, :update]
      before_action :set_group_member, only: [:index, :create]
      before_action :set_gm_period, only: [:show, :update]
      before_action :validate_only_one_current, only: [:create, :update]

      # GET /group_member/:group_member_id/gm_periods
      def index
        @gm_periods = CompleteGmPeriod.where(
          group_member_id: params[:group_member_id]
        )
        @gm_periods = DxService.load(@gm_periods, params)
        render json: @gm_periods
      end

      # GET /gm_periods/:id
      def show
        render json: @gm_period
      end

      # POST /group_member/:group_member_id/gm_periods
      def create
        @gm_period = @group_member.gm_periods.new(gm_period_params_to_create)

        if @gm_period.save
          render json: @gm_period, status: :created
        else
          render json: @gm_period.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /gm_periods/:id
      def update
        if @gm_period.update(gm_period_params_to_update)
          render json: @gm_period
        else
          render json: @gm_period.errors, status: :unprocessable_entity
        end
      end

      private

      def set_gm_period
        @gm_period = GmPeriod.find(params[:id])
      end

      def set_group_member
        @group_member = GroupMember.find(params[:group_member_id])
      end

      def gm_period_params_to_create
        params.require(:gm_period).permit(:initial_date, :final_date,
                                          :role_id, :group_member_id,
                                          :is_current,
                                          :active, :created_by)
      end

      def gm_period_params_to_update
        params.require(:gm_period).permit(:initial_date, :final_date,
                                          :role_id, :group_member_id,
                                          :is_current,
                                          :active, :updated_by)
      end

      def validate_final_date
        if params[:gm_period].has_key?(:final_date)
          fn_date = params[:gm_period][:final_date]
          unless fn_date.blank?
            begin
              fn_date.to_date
            rescue ArgumentError
              msg = "final_date is an invalid date. Use the format YYYY-MM-DD or DD-MM-YYYY."
              msg += "Can use - or /"
              return render json: { "error": msg }, status: :unprocessable_entity
            end
          end
        end
      end

      def validate_initial_date
        if params[:gm_period].has_key?(:initial_date)
          init_date = params[:gm_period][:initial_date]
          unless init_date.blank?
            begin
              init_date.to_date
            rescue ArgumentError
              msg = "initial_date is an invalid date. Use the format YYYY-MM-DD or DD-MM-YYYY."
              msg += " Can use - or /"
              return render json: { "error": msg }, status: :unprocessable_entity
            end
          end
        end
      end

      def validate_only_one_current
        if params[:gm_period].has_key?(:is_current)
          if params[:gm_period][:is_current] == true
            if @group_member.nil?
              if params[:gm_period].has_key?(:group_member_id)
                query = "group_member_id = #{params[:gm_period][:group_member_id]}"
                query += " AND is_current = true AND id != #{params[:id]}"
                query += " AND active = true"
              elsif not @gm_period.nil?
                query = "group_member_id = #{@gm_period.group_member_id}"
                query += " AND is_current = true AND id != #{params[:id]}"
                query += " AND active = true"
              else
                query = nil
              end
            else
              query = "group_member_id = #{@group_member.id}"
              query += " AND is_current = true AND active = true"
            end

            unless query.nil?
              current_period = GmPeriod.where(query)
              unless current_period.length == 0
                msg = "A record already exists as current period, in other words, with is_current: true"
                render json: { "error": msg }, status: :unprocessable_entity
              end
            end
          end
        else
          msg = "Field 'is_current' is required"
          render json: { "error": msg }, status: :unprocessable_entity
        end
      end
    end
  end
end
