class FeatsController < ApplicationController
  before_action :set_feat, only: %i[ show update destroy ]

  # GET /feats
  def index
    @feats = Feat.all

    render json: @feats
  end

  # GET /feats/1
  def show
    render json: @feat
  end

  # POST /feats
  def create
    @feat = Feat.new(feat_params)

    if @feat.save
      render json: @feat, status: :created, location: @feat
    else
      render json: @feat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /feats/1
  def update
    if @feat.update(feat_params)
      render json: @feat
    else
      render json: @feat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /feats/1
  def destroy
    @feat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feat
      @feat = Feat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feat_params
      params.require(:feat).permit(:name, :desc, :details)
    end
end
