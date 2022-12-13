class SubRacesController < ApplicationController
  before_action :set_sub_race, only: %i[ show update destroy ]

  # GET /sub_races
  def index
    @sub_races = SubRace.all

    render json: @sub_races
  end

  # GET /sub_races/1
  def show
    render json: @sub_race
  end

  # POST /sub_races
  def create
    @sub_race = SubRace.new(sub_race_params)

    if @sub_race.save
      render json: @sub_race, status: :created, location: @sub_race
    else
      render json: @sub_race.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sub_races/1
  def update
    if @sub_race.update(sub_race_params)
      render json: @sub_race
    else
      render json: @sub_race.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sub_races/1
  def destroy
    @sub_race.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_race
      @sub_race = SubRace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_race_params
      params.require(:sub_race).permit(:name, :race_id)
    end
end
