class AbstractEntityController < ApplicationController

  def set_entity
    @entity = Entity.find(params[:entity_id])
  end
end