module Api
  module V1
    class ScientificNotesController < AbstractProductResearchUnitController
      include Swagger::ScientificNoteApi

      before_action :set_research_group
      before_action :set_scientific_note, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? sci_note_params_to_deactivate
      end

      # GET /research_group/:id/scientific_notes
      def index
        sc_notes = CompleteScientificNote.where(
          research_group_id: params[:research_group_id])
        @scientific_notes = DxService.load(sc_notes, params)
        render json: @scientific_notes
      end

      # GET /research_group/:id/scientific_notes/1
      def show
        render json: @scientific_note
      end

      # POST /research_group/:id/scientific_notes
      def create
        @scientific_note = @research_group.scientific_notes.new(
          sci_note_params_to_create.except(:journal_name))
        journal = set_journal(params[:scientific_note][:journal_name],
                              @scientific_note.created_by)
        if journal
          @scientific_note.journal = journal
        else
          return
        end

        if @scientific_note.save
          render json: @scientific_note, status: :created
        else
          render json: @scientific_note.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/scientific_notes/1
      def update
        journal = set_journal(params[:scientific_note][:journal_name],
                              @scientific_note.created_by)
        if journal
          @scientific_note.journal = journal
        else
          return
        end

        if @scientific_note.update(
          sci_note_params_to_update.except(:journal_name))
          render json: @scientific_note
        else
          render json: @scientific_note.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/scientific_notes/1/active
      def change_active
        if @scientific_note.update(sci_note_params_to_deactivate)
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
      def sci_note_params_to_create
        params.require(:scientific_note).permit(
          :title, :publication_date, :approval_date, :volume,
          :number_of_pages, :initial_page, :final_page, :issn, :url, :doi,
          :observation, :category_id, :colciencias_call_id, :geo_city_id,
          :journal_name, :created_by)
      end

      def sci_note_params_to_update
        params.require(:scientific_note).permit(
          :title, :publication_date, :approval_date, :volume,
          :number_of_pages, :initial_page, :final_page, :issn, :url, :doi,
          :observation, :category_id, :colciencias_call_id, :geo_city_id,
          :journal_name, :updated_by)
      end

      def sci_note_params_to_deactivate
        params.require(:scientific_note).permit(:active, :updated_by)
      end
    end
  end
end