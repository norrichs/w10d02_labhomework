class BirdsController < ApplicationController
  before_action :set_bird, only: [:show, :update, :destroy]

  # GET /birds
  def index
    @birds = Bird.all

    render json: @birds
  end

  # GET /birds/1
  def show
    render json: @bird
  end

  # POST /birds
  def create
    @bird = Bird.new(bird_params)

    if @bird.save
      render json: @bird, status: :created, location: @bird
    else
      render json: @bird.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /birds/1
  def update
    if @bird.update(bird_params)
      render json: @bird
    else
      render json: @bird.errors, status: :unprocessable_entity
    end
  end

  # DELETE /birds/1
  def destroy
    @bird.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bird
      @bird = Bird.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bird_params
      params.require(:bird).permit(:name, :age)
    end
end
