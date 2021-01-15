module Api
  module V1
    class GroupStatesController < ApplicationController
      include Swagger::GroupStateApi

      before_action :set_group_state, only: [:show]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      # GET /group_states
      def index
        @group_states = GroupState.all.order(:name)

        render json: @group_states
      end

      # GET /group_states/1
      def show
        render json: @group_state
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_group_state
        @group_state = GroupState.find(params[:id])
      end
    end
  end
end
