module Api
  module V1
    class ParticipantTypesController < ApplicationController
      before_action :set_participant_type, only: [:show, :update]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /participant_types
      def index
        @participant_types = ParticipantType.all

        render json: @participant_types
      end

      # GET /participant_types/1
      def show
        render json: @participant_type
      end

      # POST /participant_types
      def create
        @participant_type = ParticipantType.new(participant_type_params)

        if @participant_type.save
          render json: @participant_type, status: :created
        else
          render json: @participant_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /participant_types/1
      def update
        if @participant_type.update(participant_type_params)
          render json: @participant_type
        else
          render json: @participant_type.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_participant_type
        @participant_type = ParticipantType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def participant_type_params
        params.require(:participant_type).permit(:name)
      end
    end
  end
end
