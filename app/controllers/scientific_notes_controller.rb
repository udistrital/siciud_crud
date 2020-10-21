class ScientificNotesController < ApplicationController
  before_action :set_scientific_note, only: [:show, :update, :destroy]

  # GET /scientific_notes
  def index
    @scientific_notes = ScientificNote.all

    render json: @scientific_notes
  end

  # GET /scientific_notes/1
  def show
    render json: @scientific_note
  end

  # POST /scientific_notes
  def create
    @scientific_note = ScientificNote.new(scientific_note_params)

    if @scientific_note.save
      render json: @scientific_note, status: :created, location: @scientific_note
    else
      render json: @scientific_note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scientific_notes/1
  def update
    if @scientific_note.update(scientific_note_params)
      render json: @scientific_note
    else
      render json: @scientific_note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scientific_notes/1
  def destroy
    @scientific_note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scientific_note
      @scientific_note = ScientificNote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scientific_note_params
      params.require(:scientific_note).permit(:title, :journal_title, :publication_date, :volume, :number_of_pages, :initial_page, :final_page, :issn, :url, :doi, :observation, :category_id, :journal_id, :research_group_id)
    end
end
