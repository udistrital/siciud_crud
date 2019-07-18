class EntityTypeController < ApplicationController
  def index
    @entity_types = EntityType.all
    render json: @entity_types
  end
end
