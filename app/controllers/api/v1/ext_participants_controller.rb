module Api
  module V1
    class ExtParticipantsController < ApplicationController
      before_action :set_context
      before_action :set_ext_participant, only: [:show, :update, :destroy]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET context/:id/ext_participants
      def index
        @ext_participants = @context.ext_participants.all.order(:id)

        render json: @ext_participants
      end

      # GET context/:id/ext_participants/1
      def show
        render json: @ext_participant
      end

      # POST context/:id/ext_participants
      def create
        @ext_participant = @context.ext_participants.new(ext_participant_params)

        if @ext_participant.save
          render json: @ext_participant, status: :created
        else
          render json: @ext_participant.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT context/:id/ext_participants/1
      def update
        if @ext_participant.update(ext_participant_params)
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
      def ext_participant_params
        params.require(:ext_participant).permit(:first_name,
                                                :last_name,
                                                :participant_type_id)
      end

      def set_context
        if params[:book_id]
          id = params[:book_id]
          @context = Book.find(id)
        end
      end
    end
  end
end
