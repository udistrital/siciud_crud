module Api
  module V1
    class MobilityCallCriteriaController < ApplicationController
      include Swagger::MobilityCallCriterionApi

      before_action :set_mobility_call, only: [:create]
      before_action :set_mobility_call_criterion, only: [:show, :update]

      # GET /mobility_calls/:mobility_call_id/mobility_call_criteria
      def index
        @mobility_call_criteria = CompleteMobilityCallCriterion.where(
          "id = ?", params[:mobility_call_id]
        )
        @mobility_call_criteria = DxService.load(@mobility_call_criteria, params)

        render json: @mobility_call_criteria
      end

      # GET /mobility_call_criteria/1
      def show
        render json: @mobility_call_criterion
      end

      # POST /mobility_calls/:mobility_call_id/mobility_call_criteria
      def create
        custom_params = mob_call_cri_params_to_create
        custom_params[:criteria] = params[:mobility_call_criterion][:criteria]
        save_criteria(@mobility_call, custom_params)
        @mobility_call_criteria = CompleteMobilityCallCriterion.where(
          "id = ?", params[:mobility_call_id]
        )
        render json: @mobility_call_criteria, status: :ok
      end

      # PATCH/PUT /mobility_call_criteria/1
      def update
        if @mobility_call_criterion.update(mob_call_cri_params_to_update)
          render json: @mobility_call_criterion
        else
          render json: @mobility_call_criterion.errors, status: :unprocessable_entity
        end
      end

      private

      def set_mobility_call
        @mobility_call = MobilityCall.find(params[:mobility_call_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_mobility_call_criterion
        @mobility_call_criterion = MobilityCallCriterion.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def mob_call_cri_params_to_create
        params.require(:mobility_call_criterion).permit(:mobility_call_id,
                                                        :active, :created_by,
                                                        criteria: [])
      end

      def mob_call_cri_params_to_update
        params.require(:mobility_call_criterion).permit(:mobility_call_id,
                                                        :value, :call_eval_criterion_id,
                                                        :active, :updated_by)
      end

      def save_criteria(mobility_call, params)
        criteria = params[:criteria]
        criteria.each do |criterion|
          criterion = criterion.as_json
          if params.has_key? :updated_by
            criterion[:created_by] = params[:updated_by]
            criterion[:updated_by] = params[:updated_by]
          else
            criterion[:created_by] = params[:created_by]
            criterion[:updated_by] = params[:created_by]
          end
          save_criterion(mobility_call, criterion)
        end
      end

      def save_criterion(mobility_call, criterion)
        if not criterion["id"].nil?
          @mobility_call_criterion = MobilityCallCriterion.find(criterion["id"])
          if @mobility_call_criterion.update(criterion)
            puts "Updated"
          else
            render json: @mobility_call_criterion.errors, status: :unprocessable_entity
          end
        else
          @mobility_call_criterion = mobility_call.mobility_call_criteria.new(
            criterion.except(:id, "id"))
          if @mobility_call_criterion.save
            puts "Created"
          else
            render json: @mobility_call_criterion.errors, status: :unprocessable_entity
          end
        end
      end
    end
  end
end