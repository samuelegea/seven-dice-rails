class MagicItemContentsController < ApplicationController
  before_action :set_magic_item_content, only: %i[ show update destroy ]

  # GET /magic_item_contents
  def index
    @magic_item_contents = MagicItemContent.all

    render json: @magic_item_contents
  end

  # GET /magic_item_contents/1
  def show
    render json: @magic_item_content
  end

  # POST /magic_item_contents
  def create
    @magic_item_content = MagicItemContent.new(magic_item_content_params)

    if @magic_item_content.save
      render json: @magic_item_content, status: :created, location: @magic_item_content
    else
      render json: @magic_item_content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /magic_item_contents/1
  def update
    if @magic_item_content.update(magic_item_content_params)
      render json: @magic_item_content
    else
      render json: @magic_item_content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /magic_item_contents/1
  def destroy
    @magic_item_content.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magic_item_content
      @magic_item_content = MagicItemContent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def magic_item_content_params
      params.require(:magic_item_content).permit(:holder_equipament_id, :quantity, :holded_equipament_id)
    end
end
