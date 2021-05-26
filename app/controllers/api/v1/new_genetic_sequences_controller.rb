module Api
  module V1
    class NewGeneticSequencesController < AbstractProductResearchUnitController
      include Swagger::NewGeneticSequenceApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_new_genetic_sequence, only: [:show, :update]

      # GET /research_units/:id/new_genetic_sequences
      def index
        @new_genetic_sequences = CompleteNewGeneticSequence.where(
          research_group_id: params[:research_group_id])
        @new_genetic_sequences = DxService.load(@new_genetic_sequences, params)

        render json: @new_genetic_sequences
      end

      # GET /new_genetic_sequences/1
      def show
        render json: @new_genetic_sequence
      end

      # POST /research_units/:id/new_genetic_sequences
      def create
        @new_genetic_sequence = @research_group.new_genetic_sequences.new(
          new_gs_params_to_create)

        if @new_genetic_sequence.save
          render json: @new_genetic_sequence, status: :created
        else
          render json: @new_genetic_sequence.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /new_genetic_sequences/1
      def update
        if @new_genetic_sequence.update(new_gs_params_to_update)
          render json: @new_genetic_sequence
        else
          render json: @new_genetic_sequence.errors, status: :unprocessable_entity
        end
      end

      # DELETE /new_genetic_sequences/1
      def destroy
        @new_genetic_sequence.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_new_genetic_sequence
        @new_genetic_sequence = NewGeneticSequence.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def new_gs_params_to_create
        params.require(:new_genetic_sequence).permit(:name, :obtaining_date, :certifying_institution,
                                                     :database_name, :database_url, :geo_city_id,
                                                     :geo_state_id, :geo_country_id, :category_id,
                                                     :research_group_id, :colciencias_call_id,
                                                     :observation, :active, :created_by)
      end

      def new_gs_params_to_update
        params.require(:new_genetic_sequence).permit(:name, :obtaining_date, :certifying_institution,
                                                     :database_name, :database_url, :geo_city_id,
                                                     :geo_state_id, :geo_country_id, :category_id,
                                                     :research_group_id, :colciencias_call_id,
                                                     :observation, :active, :updated_by)
      end
    end
  end
end