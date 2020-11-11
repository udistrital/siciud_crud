module Api
  module V1
    class ScientificNotesController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_scientific_note, only: [:show, :update]

      # GET /research_group/:id/scientific_notes
      def index
        @scientific_notes = @research_group.scientific_notes

        render json: @scientific_notes
      end

      # GET /research_group/:id/scientific_notes/1
      def show
        render json: @scientific_note
      end

      # POST /research_group/:id/scientific_notes
      def create
        @scientific_note = @research_group.scientific_notes.new(scientific_note_params)
        journal = set_journal(params[:scientific_note][:journal_name])
        if journal
          @scientific_note.journal = journal
        end

        if @scientific_note.save
          render json: @scientific_note, status: :created
        else
          render json: @scientific_note.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/scientific_notes/1
      def update
        if @scientific_note.update(scientific_note_params)
          render json: @scientific_note
        else
          render json: @scientific_note.errors, status: :unprocessable_entity
        end
      end


      private

      # Use callbacks to share common setup or constraints between actions.
      def set_scientific_note
        @scientific_note = @research_group.scientific_notes.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def scientific_note_params
        params.require(:scientific_note).permit(:title, :journal_title, :publication_date,
                                                :volume, :number_of_pages, :initial_page,
                                                :final_page, :issn, :url, :doi,
                                                :observation, :category_id,
                                                :geo_city_id)
      end
    end
  end
end