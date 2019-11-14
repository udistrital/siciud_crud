module Api
  module V1
    class EntityTypeController < ApplicationController
      def index
        @entity_types = EntityType.all.order(:created_at)
        render json: @entity_types
      end
    end
  end
end
