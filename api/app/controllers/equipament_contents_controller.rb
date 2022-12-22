class EquipamentContentsController < ApplicationController
  before_action :set_equipament_content, only: %i[ show update destroy ]

  # GET /equipament_contents
  def index
    @equipament_contents = EquipamentContent.all

    render json: @equipament_contents
  end

  # GET /equipament_contents/1
  def show
    render json: @equipament_content
  end

  # POST /equipament_contents
  def create
    @equipament_content = EquipamentContent.new(equipament_content_params)

    if @equipament_content.save
      render json: @equipament_content, status: :created, location: @equipament_content
    else
      render json: @equipament_content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equipament_contents/1
  def update
    if @equipament_content.update(equipament_content_params)
      render json: @equipament_content
    else
      render json: @equipament_content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /equipament_contents/1
  def destroy
    @equipament_content.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipament_content
      @equipament_content = EquipamentContent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipament_content_params
      params.require(:equipament_content).permit(:holder_equipament_id, :quantity, :holded_equipament_id)
    end
end
