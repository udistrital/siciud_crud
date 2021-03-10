module Api
  module V1
    class IntParticipantsController < ApplicationController
      include Swagger::IntParticipantApi

      before_action :set_context
      before_action :set_int_participant, only: [:show, :update]

      # GET context/:id/int_participants
      def index
        @int_participants = @context.int_participants.all.order(:id)

        render json: @int_participants
      end

      # GET context/:id/int_participants/1
      def show
        render json: @int_participant
      end

      # POST context/:id/int_participants
      def create
        @int_participant = @context.int_participants.new(int_participant_params)

        if @int_participant.save
          render json: @int_participant, status: :created
        else
          render json: @int_participant.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT context/:id/int_participants/1
      def update
        if @int_participant.update(int_participant_params)
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
      def int_participant_params
        params.require(:int_participant).permit(:researcher_id,
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
