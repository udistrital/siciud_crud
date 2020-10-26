class ExtParticipantsController < ApplicationController
  before_action :set_ext_participant, only: [:show, :update, :destroy]

  # GET /ext_participants
  def index
    @ext_participants = ExtParticipant.all

    render json: @ext_participants
  end

  # GET /ext_participants/1
  def show
    render json: @ext_participant
  end

  # POST /ext_participants
  def create
    @ext_participant = ExtParticipant.new(ext_participant_params)

    if @ext_participant.save
      render json: @ext_participant, status: :created, location: @ext_participant
    else
      render json: @ext_participant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ext_participants/1
  def update
    if @ext_participant.update(ext_participant_params)
      render json: @ext_participant
    else
      render json: @ext_participant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ext_participants/1
  def destroy
    @ext_participant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ext_participant
      @ext_participant = ExtParticipant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ext_participant_params
      params.require(:ext_participant).permit(:first_name, :last_name, :producible_id, :producible_type, :participant_type_id)
    end
end
