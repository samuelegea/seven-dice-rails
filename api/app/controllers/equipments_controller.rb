class EquipmentsController < ApplicationController
  before_action :set_equipament, only: %i[show update destroy]

  # GET /equipments
  def index
    @equipments = Equipment.all

    render json: @equipments
  end

  # GET /equipments/1
  def show
    render json: @equipament
  end

  # POST /equipments
  def create
    @equipament = Equipment.new(equipament_params)

    if @equipment.save
      render json: @equipament, status: :created, location: @equipament
    else
      render json: @equipment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equipments/1
  def update
    if @equipment.update(equipament_params)
      render json: @equipament
    else
      render json: @equipment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /equipments/1
  def destroy
    @equipment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_equipament
    @equipament = Equipment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def equipament_params
    params.require(:equipament).permit(:name, :desc, :details)
  end
end
