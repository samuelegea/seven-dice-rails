class MagicItemsController < ApplicationController
  before_action :set_magic_item, only: %i[ show update destroy ]

  # GET /magic_items
  def index
    @magic_items = MagicItem.all

    render json: @magic_items
  end

  # GET /magic_items/1
  def show
    render json: @magic_item
  end

  # POST /magic_items
  def create
    @magic_item = MagicItem.new(magic_item_params)

    if @magic_item.save
      render json: @magic_item, status: :created, location: @magic_item
    else
      render json: @magic_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /magic_items/1
  def update
    if @magic_item.update(magic_item_params)
      render json: @magic_item
    else
      render json: @magic_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /magic_items/1
  def destroy
    @magic_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magic_item
      @magic_item = MagicItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def magic_item_params
      params.require(:magic_item).permit(:name, :desc, :details)
    end
end
