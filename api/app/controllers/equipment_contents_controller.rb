class EquipmentContentsController < ApplicationController
  before_action :set_equipment_content, only: %i[show update destroy]

  # GET /equipment_contents
  def index
    @equipment_contents = EquipmentContent.all

    render json: @equipment_contents
  end

  # GET /equipment_contents/1
  def show
    render json: @equipment_content
  end

  # POST /equipment_contents
  def create
    @equipment_content = EquipmentContent.new(equipment_content_params)

    if @equipment_content.save
      render json: @equipment_content, status: :created, location: @equipment_content
    else
      render json: @equipment_content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equipment_contents/1
  def update
    if @equipment_content.update(equipment_content_params)
      render json: @equipment_content
    else
      render json: @equipment_content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /equipment_contents/1
  def destroy
    @equipment_content.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_equipment_content
    @equipment_content = EquipmentContent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def equipment_content_params
    params.require(:equipment_content).permit(:holder_equipament_id, :quantity, :holded_equipament_id)
  end
end
