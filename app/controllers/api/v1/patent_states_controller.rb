module Api
  module V1
    class PatentStatesController < ApplicationController
      include Swagger::PatentStateApi

      before_action :set_patent_state, only: [:show, :update]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /patent_states
      def index
        @patent_states = PatentState.all

        render json: @patent_states
      end

      # GET /patent_states/1
      def show
        render json: @patent_state
      end

      # POST /patent_states
      def create
        @patent_state = PatentState.new(patent_state_params)

        if @patent_state.save
          render json: @patent_state, status: :created
        else
          render json: @patent_state.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /patent_states/1
      def update
        if @patent_state.update(patent_state_params)
          render json: @patent_state
        else
          render json: @patent_state.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_patent_state
        @patent_state = PatentState.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def patent_state_params
        params.require(:patent_state).permit(:name)
      end
    end
  end
end
