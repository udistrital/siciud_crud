module Api
  module V1
    class ExtParticipantsController < ApplicationController
      include Swagger::ExtParticipantApi

      before_action :set_product_context
      before_action :set_ext_participant, only: [:show, :update]

      # GET context/:id/ext_participants
      def index
        context_name = @context.class.name
        @ext_participants = CompleteExtParticipant.where(
          product_type: context_name, product_type_id: @context.id
        )
        @ext_participants = DxService.load(@ext_participants, params)

        render json: @ext_participants
      end

      # GET context/:id/ext_participants/1
      def show
        render json: @ext_participant
      end

      # POST context/:id/ext_participants
      def create
        @ext_participant = @context.ext_participants.new(ext_p_params_to_create)

        if @ext_participant.save
          render json: @ext_participant, status: :created
        else
          render json: @ext_participant.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT context/:id/ext_participants/1
      def update
        if @ext_participant.update(ext_p_params_to_update)
          render json: @ext_participant
        else
          render json: @ext_participant.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_ext_participant
        @ext_participant = @context.ext_participants.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ext_p_params_to_create
        params.require(:ext_participant).permit(:first_name,
                                                :last_name,
                                                :participant_type_id,
                                                :created_by)
      end

      def ext_p_params_to_update
        params.require(:ext_participant).permit(:first_name,
                                                :last_name,
                                                :participant_type_id,
                                                :updated_by)
      end

      def ext_p_params_to_deactivate
        params.require(:ext_participant).permit(:active,
                                                :participant_type_id)
      end

    end
  end
end
