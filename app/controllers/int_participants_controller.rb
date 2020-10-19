class IntParticipantsController < ApplicationController
  before_action :set_int_participant, only: [:show, :update, :destroy]

  # GET /int_participants
  def index
    @int_participants = IntParticipant.all

    render json: @int_participants
  end

  # GET /int_participants/1
  def show
    render json: @int_participant
  end

  # POST /int_participants
  def create
    @int_participant = IntParticipant.new(int_participant_params)

    if @int_participant.save
      render json: @int_participant, status: :created, location: @int_participant
    else
      render json: @int_participant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /int_participants/1
  def update
    if @int_participant.update(int_participant_params)
      render json: @int_participant
    else
      render json: @int_participant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /int_participants/1
  def destroy
    @int_participant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_int_participant
      @int_participant = IntParticipant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def int_participant_params
      params.require(:int_participant).permit(:producible_id, :producible_type, :research_group_id, :participant_type_id)
    end
end
