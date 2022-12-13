class DndSubClassesController < ApplicationController
  before_action :set_dnd_sub_class, only: %i[ show update destroy ]

  # GET /dnd_sub_classes
  def index
    @dnd_sub_classes = DndSubClass.all

    render json: @dnd_sub_classes
  end

  # GET /dnd_sub_classes/1
  def show
    render json: @dnd_sub_class
  end

  # POST /dnd_sub_classes
  def create
    @dnd_sub_class = DndSubClass.new(dnd_sub_class_params)

    if @dnd_sub_class.save
      render json: @dnd_sub_class, status: :created, location: @dnd_sub_class
    else
      render json: @dnd_sub_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dnd_sub_classes/1
  def update
    if @dnd_sub_class.update(dnd_sub_class_params)
      render json: @dnd_sub_class
    else
      render json: @dnd_sub_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dnd_sub_classes/1
  def destroy
    @dnd_sub_class.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dnd_sub_class
      @dnd_sub_class = DndSubClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dnd_sub_class_params
      params.require(:dnd_sub_class).permit(:name, :desc, :details, :dnd_class_id)
    end
end
