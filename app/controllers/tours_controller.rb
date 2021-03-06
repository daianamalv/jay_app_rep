class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all
    @cities = City.all
    @places = Place.all
    @user = User.first
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    @user = User.first
  end

  # GET /tours/new
  def new
    @tour = Tour.new
    @user = User.first
  end

  # GET /tours/1/edit
  def edit
    @user = User.first
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to new_place_path(@tour), notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_favourite
    Favourite.create(user_id: 1, tour_id: params[:tour_id])
    redirect_to tour_path(params[:tour_id]), notice: 'Added to favourites'
  end


  def remove_from_favourite
    Favourite.destroy(user_id: 1, tour_id: params[:tour_id])
    redirect_to tour_path(params[:tour_id]), notice: 'Removed from favourites'
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tour_params
      params.require(:tour).permit(:title, :description, :avatar_link, :city_id, :user_id, :image, :cover)
    end
end
