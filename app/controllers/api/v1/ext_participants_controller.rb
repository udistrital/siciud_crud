module Api
  module V1
    class ExtParticipantsController < ApplicationController
      include Swagger::ExtParticipantApi

      before_action :set_context
      before_action :set_ext_participant, only: [:show, :update]

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

      def set_context
        if params[:book_id]
          id = params[:book_id]
          @context = Book.find(id)
        elsif params[:book_chapter_id]
          id = params[:book_chapter_id]
          @context = BookChapter.find(id)
        elsif params[:ip_livestock_breed_id]
          id = params[:ip_livestock_breed_id]
          @context = IpLivestockBreed.find(id)
        elsif params[:new_animal_breed_id]
          id = params[:new_animal_breed_id]
          @context = NewAnimalBreed.find(id)
        elsif params[:paper_id]
          id = params[:paper_id]
          @context = Paper.find(id)
        elsif params[:patent_id]
          id = params[:patent_id]
          @context = Patent.find(id)
        elsif params[:research_creation_work_id]
          id = params[:research_creation_work_id]
          @context = ResearchCreationWork.find(id)
        elsif params[:scientific_note_id]
          id = params[:scientific_note_id]
          @context = ScientificNote.find(id)
        elsif params[:vegetable_variety_id]
          id = params[:vegetable_variety_id]
          @context = VegetableVariety.find(id)
        end
      end
    end
  end
end
