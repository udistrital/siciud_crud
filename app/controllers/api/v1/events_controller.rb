module Api
  module V1
    class EventsController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_event, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? event_params_to_deactivate
      end

      # GET /research_units/:id/events
      def index
        if params[:eve_type_id]
          @events = CompleteEvent.where(
            "research_group_id = ? AND eve_type_id = ?",
            params[:research_group_id], params[:eve_type_id]
          )
        else
          @events = CompleteEvent.where(
            research_group_id: params[:research_group_id]
          )
        end
        @events = DxService.load(@events, params)

        render json: @events
      end

      # GET /research_units/:id/events/1
      def show
        render json: @event
      end

      # POST /research_units/:id/events
      def create
        @event = @research_group.events.new(event_params_to_create)

        if @event.save
          render json: @event, status: :created
        else
          render json: @event.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_units/:id/events/1
      def update
        if @event.update(event_params_to_update)
          render json: @event
        else
          render json: @event.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_units/:id/events/1/active
      def change_active
        if @event.update(event_params_to_deactivate)
          render json: @event
        else
          render json: @event.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = @research_group.events.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def event_params_to_create
        params.require(:event).permit(:eve_name, :eve_start_date, :eve_finish_date,
                                      :eve_organizers, :eve_entities, :category_id,
                                      :colciencias_call_id, :eve_observation, :eve_type_id,
                                      :created_by)
      end

      def event_params_to_update
        params.require(:event).permit(:eve_name, :eve_start_date, :eve_finish_date,
                                      :eve_organizers, :eve_entities, :category_id,
                                      :colciencias_call_id, :eve_observation, :eve_type_id,
                                      :updated_by)
      end

      def event_params_to_deactivate
        params.require(:event).permit(:active, :updated_by)
      end
    end
  end
end