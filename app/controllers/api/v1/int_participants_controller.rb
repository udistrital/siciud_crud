module Api
  module V1
    class IntParticipantsController < ApplicationController
      include Swagger::IntParticipantApi

      before_action :set_product_context
      before_action :set_int_participant, only: [:show, :update]

      # GET context/:id/int_participants
      def index
        context_name = @context.class.name
        @int_participants = CompleteIntParticipant.where(
          product_type: context_name, product_type_id: @context.id
        )
        @int_participants = DxService.load(@int_participants, params)
        render json: @int_participants
      end

      # GET context/:id/int_participants/1
      def show
        render json: @int_participant
      end

      # POST context/:id/int_participants
      def create
        @int_participant = @context.int_participants.new(int_p_params_to_create)

        if @int_participant.save
          render json: @int_participant, status: :created
        else
          render json: @int_participant.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT context/:id/int_participants/1
      def update
        if @int_participant.update(int_p_params_to_update)
          render json: @int_participant
        else
          render json: @int_participant.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_int_participant
        @int_participant = @context.int_participants.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def int_p_params_to_create
        params.require(:int_participant).permit(:researcher_id,
                                                :participant_type_id,
                                                :created_by)
      end

      def int_p_params_to_update
        params.require(:int_participant).permit(:researcher_id,
                                                :participant_type_id,
                                                :updated_by)
      end

      def int_p_params_to_deactivate
        params.require(:int_participant).permit(:active, :updated_by)
      end

    end
  end
end
