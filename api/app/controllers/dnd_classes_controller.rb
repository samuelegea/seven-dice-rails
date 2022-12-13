class DndClassesController < ApplicationController
  before_action :set_dnd_class, only: %i[ show update destroy ]

  # GET /dnd_classes
  def index
    @dnd_classes = DndClass.all

    render json: @dnd_classes
  end

  # GET /dnd_classes/1
  def show
    render json: @dnd_class
  end

  # POST /dnd_classes
  def create
    @dnd_class = DndClass.new(dnd_class_params)

    if @dnd_class.save
      render json: @dnd_class, status: :created, location: @dnd_class
    else
      render json: @dnd_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dnd_classes/1
  def update
    if @dnd_class.update(dnd_class_params)
      render json: @dnd_class
    else
      render json: @dnd_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dnd_classes/1
  def destroy
    @dnd_class.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dnd_class
      @dnd_class = DndClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dnd_class_params
      params.require(:dnd_class).permit(:name, :desc, :details)
    end
end
