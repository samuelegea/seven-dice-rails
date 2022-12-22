class EquipamentCategoriesController < ApplicationController
  before_action :set_equipament_category, only: %i[ show update destroy ]

  # GET /equipament_categories
  def index
    @equipament_categories = EquipamentCategory.all

    render json: @equipament_categories
  end

  # GET /equipament_categories/1
  def show
    render json: @equipament_category
  end

  # POST /equipament_categories
  def create
    @equipament_category = EquipamentCategory.new(equipament_category_params)

    if @equipament_category.save
      render json: @equipament_category, status: :created, location: @equipament_category
    else
      render json: @equipament_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equipament_categories/1
  def update
    if @equipament_category.update(equipament_category_params)
      render json: @equipament_category
    else
      render json: @equipament_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /equipament_categories/1
  def destroy
    @equipament_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipament_category
      @equipament_category = EquipamentCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipament_category_params
      params.require(:equipament_category).permit(:name)
    end
end
