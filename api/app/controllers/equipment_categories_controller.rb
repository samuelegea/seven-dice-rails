class EquipmentCategoriesController < ApplicationController
  before_action :set_equipment_category, only: %i[show update destroy]

  # GET /equipment_categories
  def index
    @equipment_categories = EquipmentCategory.all

    render json: @equipment_categories
  end

  # GET /equipment_categories/1
  def show
    render json: @equipment_category
  end

  # POST /equipment_categories
  def create
    @equipment_category = EquipmentCategory.new(equipment_category_params)

    if @equipment_category.save
      render json: @equipment_category, status: :created, location: @equipment_category
    else
      render json: @equipment_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equipment_categories/1
  def update
    if @equipment_category.update(equipment_category_params)
      render json: @equipment_category
    else
      render json: @equipment_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /equipment_categories/1
  def destroy
    @equipment_category.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_equipment_category
    @equipment_category = EquipmentCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def equipment_category_params
    params.require(:equipment_category).permit(:name)
  end
end
